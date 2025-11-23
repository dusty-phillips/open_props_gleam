import lustre
import lustre/attribute
import lustre/element/html
import open_props/colors
import open_props/sizes

// gleam add lustre
// gleam add --dev lustre_dev_tools
// see CDN stylesheets imported in gleam.toml under tools.lustre.html
// gleam run _m lustre/dev start basic_lustre_renderer

pub fn main() {
  let app =
    lustre.element(
      html.div(
        [
          attribute.styles([
            #("background-color", colors.pink_1),
            #("margin", sizes.size_5),
            #("padding", sizes.size_8),
          ]),
        ],
        [
          html.text("hello world"),
        ],
      ),
    )

  let assert Ok(_) = lustre.start(app, "#app", Nil)

  Nil
}
