# neovim
My dotfile configurations for NeoVim.

> I have chosen to not include auto-formatters such as `conform` since most prettifiers have a way to format via command line or `pre-commit` integration.

> There seems to be an issue where space indentation settings are being ignored and indents are being replaced with tab characters (`\t`) on buffer to file write.

# Requirements
## Required
| Name | Link | Note |
|------|------|------|
| Node Version Manager | https://github.com/nvm-sh/nvm | Simplifies NodeJS version management. Needed to install the Typescript Language Server |

## Recommended
| Name | Link | Note |
|------|------|------|
| Rust | https://www.rust-lang.org/tools/install | Some NeoVim plugins require rust and rustup to build the plugin (e.g. `saghen/blink.cmp` nightly build) |
| Rustup | https://rustup.rs/ | Some NeoVim plugins require rust and rustup to build the plugin (e.g. `saghen/blink.cmp` nightly build) |
| Simple Python Version Management |  https://github.com/pyenv/pyenv | Simplifies Python version management. `pip` can be used to install image to ASCII art conversion tools. |

# Installation
Clone this repository, then copy the config files to the user's proper nvim directory.

For example:
```bash
cp -R . ~/.config/nvim
```

> The above command assumes the user is in the nvim directory of the cloned, git repository.

Finally, open nvim - the plugins should automatically install.

# Plugins
This NeoVim dotfile config contains the following modules:
| Type | Plugin/ Module | Note |
|------|------|------|
| Plugin Manager | * `folke/lazy.nvim` * `williamboman/mason.nvim` | The core NeoVim plugin manager. This plugin manager lazy loads plugins. Mason acts as the secondary registry for edge cases such as `js-debug-adapter`. |
| Language Server Protocol | * `neovim/nvim-lspconfig` | Mechanism for enabling programming language types, semantics, keywords, etc. |
| Debug Adapter Protocol | * `mfussenegger/nvim-dap` | Mechanism for enabling programming language types, semantics, keywords, etc. |
| Telescope | * `nvim-telescope/telescope.nvim` | Fast `file`, `directory` and `grep` fuzzy finder. |
| File Explorer | * `nvim-tree/nvim-tree.lua` | Visual File/ Directory Explorer with toggle capabilities. |
| Auto-Completion | * `nvim-tree/nvim-tree.lua` | Simple  |
| Character Autobalance Formatter | * `windwp/nvim-autopairs` | Autobalanced pair characters (e.g. {}, (), [], etc.) and preserves indentation when tabs are inserted. |
| Color Scheme | * `rebelot/kanagawa.nvim` | Color Scheme for NeoVim. |
| Greeter | * `goolord/alpha-nvim` | Customizable langing page for NeoVim with ASCII art capabilities. |
| Code Commenter | * `numToStr/Comment.nvim` | Code comment plugin (e.g. single, multiline comments). |
| Indentation Highlighter | * `lukas-reineke/indent-blankline.nvim` | Highlights indentations for visual ease and readability. |
| TODO Highlights | * `folke/todo-comments.nvim` | Customizable highlights for keywords such as `TODO`. |

> Warning - Markdown Preview seems to be having issues on `brave` + `arch-linux`.
