import lustre
import lustre/attribute
import lustre/element/html
import monks/background_color
import monks/margin
import monks/padding
import open_props/colors
import open_props/sizes

// gleam add lustre monks_of_style
// gleam add --dev lustre_dev_tools
// see CDN stylesheets imported in gleam.toml under tools.lustre.html
// gleam run -m lustre/dev start basic_lustre_monks_of_style_renderer

pub fn main() {
  let app =
    lustre.element(
      html.div(
        [
          attribute.styles([
            background_color.raw(colors.pink_1),
            margin.raw(sizes.size_5),
            padding.raw(sizes.size_8),
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
