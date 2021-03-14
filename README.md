🌴 Frond Markdown Notes
======================

Frond is a lightweight, web based, self-hosted app for storing Markdown notes.

I created Frond ~~because everyone must build a notes app at least once~~ as replacement for Simplenote after I experienced bugs and flaky behaviour. I switched to Fastmail notes, which work pretty well but they don't have any Markdown features such as Markdown aware editing, or preview. I also tried Standard Notes but the Markdown support overrides the `textarea` meaning all native functionality like spell checking is lost when editing on mobile.

<!-- Insert Screenshot -->

Features
--------

**What's Included:**

* Markdown editing in a simple `textarea`
* Markdown preview
* Usable without JavaScript
* Full text search (TODO)
* Super fast and memory efficient native code (written in Crystal)
* Adorable palm tree emoji favicon
* Works in `lynx`

**What's not included:**

* User tracking
* Megabytes of JavaScript

Setting Up the Project
----------------------

This is a project built using [Lucky](https://luckyframework.org) in [Crystal].

1. [Install required dependencies](https://luckyframework.org/guides/getting-started/installing#install-required-dependencies)
1. Update database settings in `config/database.cr`
1. Run `script/setup`
1. Run `lucky dev` to start the app

### Learning Lucky

Lucky uses the [Crystal](https://crystal-lang.org) programming language. You can learn about Lucky from the [Lucky Guides](https://luckyframework.org/guides/getting-started/why-lucky).

Licence
-------

This project is dual licenced under either of:

- Apache License, Version 2.0 ([LICENSE-APACHE](https://github.com/wezm/frond/blob/master/LICENSE-APACHE))
- MIT license ([LICENSE-MIT](https://github.com/wezm/frond/blob/master/LICENSE-MIT))

at your option.

[Crystal]: https://crystal-lang.org/
