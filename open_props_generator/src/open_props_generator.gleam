import gleam/http/request
import gleam/httpc
import gleam/io
import gleam/list
import gleam/option
import gleam/regexp
import gleam/string
import gleam/uri
import simplifile

const open_props_base = "https://raw.githubusercontent.com/argyleink/open-props/refs/heads/main/src/"

pub fn main() -> Nil {
  let index = fetch_openprops("index.css")
  let assert Ok(var_regex) =
    regexp.from_string("@import 'props\\.([^']+)\\.css';")
  let matches = regexp.scan(var_regex, index)
  list.each(matches, process_props_file)

  Nil
}

fn fetch_openprops(relative: String) -> String {
  let assert Ok(index) = uri.parse(open_props_base <> relative)
  let assert Ok(request) = request.from_uri(index)
  let assert Ok(response) = httpc.send(request)
  response.body
}

fn process_props_file(match: regexp.Match) -> Nil {
  let assert regexp.Match(_, [option.Some(name)]) = match
  let content = fetch_openprops("props." <> name <> ".css")

  let assert Ok(var_regex) = regexp.from_string("--([-a-z1-90]+):")
  let matches = regexp.scan(var_regex, content)

  let gleam_functions =
    list.fold(matches, "", fn(accumulator, match) {
      let assert regexp.Match(variable, [option.Some(name)]) = match
      case name {
        "gradient-space" -> accumulator
        "shadow-color" -> accumulator
        "shadow-strength" -> accumulator
        "inner-shadow-highlight" -> accumulator
        _ ->
          accumulator
          <> "\n\npub const "
          <> name |> string.replace("-", "_")
          <> " = \"var("
          <> variable |> string.replace(":", "")
          <> ")\""
      }
    })

  let output_filename = "output/" <> name <> ".gleam"

  let assert Ok(_) = simplifile.write(output_filename, gleam_functions)
  io.println("Wrote " <> output_filename)

  Nil
}
