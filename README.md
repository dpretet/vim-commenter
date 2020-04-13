# vim-commenter

## Introduction

Vim-commenter is a vim plugin to comment / uncomment code lines. It toggles
comment on a single line or on a visual selection.

## Installation

Use [Vim-Plug](https://github.com/junegunn/vim-plug) or any other plugin
manager to install it.

```vim
Plug 'damofthemoon/vim-commenter'
```

## Usage

Call command `Commenter` on a single line or on a visual selection.

```vim
    :Commenter
    :'<,'>Commenter
```

## License

This plugin is under MIT license. Do whatever you want with it, and don't
hesitate to fork it and contribute!
