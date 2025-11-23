import lustre
import open_props/colors
import open_props/sizes
import sketch/css
import sketch/lustre as sk_lustre
import sketch/lustre/element/html as sk_html

// gleam add lustre sketch sketch_lustre
// gleam add --dev lustre_dev_tools
// see CDN stylesheets imported in gleam.toml under tools.lustre.html
// gleam run _m lustre/dev start basic_lustre_sketch_renderer

pub fn main() {
  let assert Ok(stylesheet) = sk_lustre.setup()

  let assert Ok(_) = lustre.start(lustre.element(view(stylesheet)), "#app", Nil)
}

pub fn view(stylesheet) {
  use <- sk_lustre.render(stylesheet:, in: [sk_lustre.node()])
  sk_html.div(
    css.class([
      css.background_color(colors.blue_1),
      css.color(colors.blue_11),
      css.margin_(sizes.size_8),
      css.padding_(sizes.size_9),
      css.text_align("center"),
    ]),
    [],
    [
      sk_html.text("hello world"),
    ],
  )
}
