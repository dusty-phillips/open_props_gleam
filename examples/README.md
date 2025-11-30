# open_props Examples

Contains two example scripts for using the Gleam open_props package
with [lustre](https://hexdocs.pm/lustre/) in raw styles format or with
the [sketch](https://hexdocs.pm/sketch/) css library:

- [./src/basic_lustre_renderer.gleam](./src/basic_lustre_renderer.gleam)
- [./src/basic_lustre_sketch_renderer.gleam](./src/basic_lustre_sketch_renderer.gleam)

To run them use lustre dev tools like so:

```
gleam run -m lustre/dev start basic_lustre_renderer
```

or

```
gleam run -m lustre/dev start basic_lustre_sketch_renderer
```

or

```
gleam run -m lustre/dev start basic_lustre_monks_of_style_renderer
```

In your own projects, you'll need to ensure that:

- lustre, lustre_dev_tools, and (optionally) sketch or monks_of_style are
  installed `gleam add lustre sketch sketch_lustre monks_of_style gleam add
--dev lustre_dev_tools`
- the open-props css files are available for your build system. In this
  example, see the tools.lustre.html section of [./gleam.toml](./gleam.toml) but
  you can also install them in the various other ways opne-props allows depending
  on your setup.
