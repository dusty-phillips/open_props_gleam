# open_props

Constant strings to get strong typing for the CSS variables used in the
[open-props](https://open-props.style/) design system. The strings are
generated from the raw open_props css files.

To use them, just import the appropriate module and use them as values. For example
with the [sketch](https://hexdocs.pm/sketch/) css framework:

```gleam
import open_props/colors
import open_props/sizes
import sketch/css
import sketch/lustre as sk_lustre
import sketch/lustre/element/html as sk_html

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
```

They can also be used with raw style tags or other CSS systems if you prefer.
