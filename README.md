# Mogee.nvim

## Introduction

This is my personal neovim configuration. It was built from [kickstart](https://github.com/nvim-lua/kickstart.nvim)
My other neovim configuration is by [LazyVim by Folke](https://www.lazyvim.org/), whereas in this configuration everything is done from scratch for more control over my configuration.

Alot of keymaps, plugins and functionality are inspired by [LazyVim by Folke](https://www.lazyvim.org/), this video guide by [DevAsLife](https://www.youtube.com/watch?v=fFHlfbKVi30), and this video playlist by [typecraft](https://www.youtube.com/watch?v=zHTeCSVAFNY&list=PLsz00TDipIffreIaUNk64KxTIkQaGguqn).

<a href="https://dotfyle.com/itsmogee/nvim"><img src="https://dotfyle.com/itsmogee/nvim/badges/plugins?style=flat" /></a>
<a href="https://dotfyle.com/itsmogee/nvim"><img src="https://dotfyle.com/itsmogee/nvim/badges/leaderkey?style=flat" /></a>
<a href="https://dotfyle.com/itsmogee/nvim"><img src="https://dotfyle.com/itsmogee/nvim/badges/plugin-manager?style=flat" /></a>

## Install Instructions

> Install requires Neovim 0.9+. Always review the code before installing a configuration.

Clone the repository and install the plugins:

```sh
git clone git@github.com:itsmogee/nvim ~/.config/itsmogee/nvim
```

Open Neovim with this config:

```sh
NVIM_APPNAME=itsmogee/nvim/ nvim
```

## Plugins

### ai

- [jackMort/ChatGPT.nvim](https://dotfyle.com/plugins/jackMort/ChatGPT.nvim)

### color

- [folke/twilight.nvim](https://dotfyle.com/plugins/folke/twilight.nvim)
- [NvChad/nvim-colorizer.lua](https://dotfyle.com/plugins/NvChad/nvim-colorizer.lua)

### colorscheme

- [sainnhe/gruvbox-material](https://dotfyle.com/plugins/sainnhe/gruvbox-material)
- [catppuccin/nvim](https://dotfyle.com/plugins/catppuccin/nvim)
- [folke/tokyonight.nvim](https://dotfyle.com/plugins/folke/tokyonight.nvim)

### comment

- [folke/todo-comments.nvim](https://dotfyle.com/plugins/folke/todo-comments.nvim)

### completion

- [hrsh7th/nvim-cmp](https://dotfyle.com/plugins/hrsh7th/nvim-cmp)

### debugging

- [mfussenegger/nvim-dap](https://dotfyle.com/plugins/mfussenegger/nvim-dap)
- [rcarriga/nvim-dap-ui](https://dotfyle.com/plugins/rcarriga/nvim-dap-ui)
- [theHamsta/nvim-dap-virtual-text](https://dotfyle.com/plugins/theHamsta/nvim-dap-virtual-text)

### diagnostics

- [folke/trouble.nvim](https://dotfyle.com/plugins/folke/trouble.nvim)

### editing-support

- [debugloop/telescope-undo.nvim](https://dotfyle.com/plugins/debugloop/telescope-undo.nvim)
- [folke/zen-mode.nvim](https://dotfyle.com/plugins/folke/zen-mode.nvim)
- [nvim-treesitter/nvim-treesitter-context](https://dotfyle.com/plugins/nvim-treesitter/nvim-treesitter-context)
- [shortcuts/no-neck-pain.nvim](https://dotfyle.com/plugins/shortcuts/no-neck-pain.nvim)
- [windwp/nvim-autopairs](https://dotfyle.com/plugins/windwp/nvim-autopairs)

### file-explorer

- [nvim-neo-tree/neo-tree.nvim](https://dotfyle.com/plugins/nvim-neo-tree/neo-tree.nvim)

### formatting

- [stevearc/conform.nvim](https://dotfyle.com/plugins/stevearc/conform.nvim)

### fuzzy-finder

- [nvim-telescope/telescope.nvim](https://dotfyle.com/plugins/nvim-telescope/telescope.nvim)

### git

- [NeogitOrg/neogit](https://dotfyle.com/plugins/NeogitOrg/neogit)
- [sindrets/diffview.nvim](https://dotfyle.com/plugins/sindrets/diffview.nvim)
- [ejrichards/baredot.nvim](https://dotfyle.com/plugins/ejrichards/baredot.nvim)
- [kdheepak/lazygit.nvim](https://dotfyle.com/plugins/kdheepak/lazygit.nvim)
- [lewis6991/gitsigns.nvim](https://dotfyle.com/plugins/lewis6991/gitsigns.nvim)
- [echasnovski/mini.diff](https://dotfyle.com/plugins/echasnovski/mini.diff)

### icon

- [nvim-tree/nvim-web-devicons](https://dotfyle.com/plugins/nvim-tree/nvim-web-devicons)

### indent

- [lukas-reineke/indent-blankline.nvim](https://dotfyle.com/plugins/lukas-reineke/indent-blankline.nvim)

### keybinding

- [folke/which-key.nvim](https://dotfyle.com/plugins/folke/which-key.nvim)

### lsp

- [neovim/nvim-lspconfig](https://dotfyle.com/plugins/neovim/nvim-lspconfig)
- [mfussenegger/nvim-jdtls](https://dotfyle.com/plugins/mfussenegger/nvim-jdtls)
- [mfussenegger/nvim-lint](https://dotfyle.com/plugins/mfussenegger/nvim-lint)
- [j-hui/fidget.nvim](https://dotfyle.com/plugins/j-hui/fidget.nvim)
- [smjonas/inc-rename.nvim](https://dotfyle.com/plugins/smjonas/inc-rename.nvim)

### lsp-installer

- [williamboman/mason.nvim](https://dotfyle.com/plugins/williamboman/mason.nvim)

### lua-colorscheme

- [ellisonleao/gruvbox.nvim](https://dotfyle.com/plugins/ellisonleao/gruvbox.nvim)

### markdown-and-latex

- [iamcco/markdown-preview.nvim](https://dotfyle.com/plugins/iamcco/markdown-preview.nvim)
- [OXY2DEV/markview.nvim](https://dotfyle.com/plugins/OXY2DEV/markview.nvim)
- [MeanderingProgrammer/markdown.nvim](https://dotfyle.com/plugins/MeanderingProgrammer/markdown.nvim)

### media

- [3rd/image.nvim](https://dotfyle.com/plugins/3rd/image.nvim)

### motion

- [folke/flash.nvim](https://dotfyle.com/plugins/folke/flash.nvim)

### note-taking

- [epwalsh/obsidian.nvim](https://dotfyle.com/plugins/epwalsh/obsidian.nvim)

### nvim-dev

- [MunifTanjim/nui.nvim](https://dotfyle.com/plugins/MunifTanjim/nui.nvim)
- [nvim-lua/plenary.nvim](https://dotfyle.com/plugins/nvim-lua/plenary.nvim)
- [folke/neodev.nvim](https://dotfyle.com/plugins/folke/neodev.nvim)

### plugin-manager

- [folke/lazy.nvim](https://dotfyle.com/plugins/folke/lazy.nvim)

### search

- [nvim-pack/nvim-spectre](https://dotfyle.com/plugins/nvim-pack/nvim-spectre)

### snippet

- [rafamadriz/friendly-snippets](https://dotfyle.com/plugins/rafamadriz/friendly-snippets)
- [L3MON4D3/LuaSnip](https://dotfyle.com/plugins/L3MON4D3/LuaSnip)

### startup

- [goolord/alpha-nvim](https://dotfyle.com/plugins/goolord/alpha-nvim)

### statusline

- [nvim-lualine/lualine.nvim](https://dotfyle.com/plugins/nvim-lualine/lualine.nvim)
- [b0o/incline.nvim](https://dotfyle.com/plugins/b0o/incline.nvim)

### syntax

- [nvim-treesitter/nvim-treesitter-textobjects](https://dotfyle.com/plugins/nvim-treesitter/nvim-treesitter-textobjects)
- [nvim-treesitter/nvim-treesitter](https://dotfyle.com/plugins/nvim-treesitter/nvim-treesitter)

### tabline

- [akinsho/bufferline.nvim](https://dotfyle.com/plugins/akinsho/bufferline.nvim)

### terminal-integration

- [akinsho/toggleterm.nvim](https://dotfyle.com/plugins/akinsho/toggleterm.nvim)

### utility

- [echasnovski/mini.nvim](https://dotfyle.com/plugins/echasnovski/mini.nvim)
- [stevearc/dressing.nvim](https://dotfyle.com/plugins/stevearc/dressing.nvim)
- [rcarriga/nvim-notify](https://dotfyle.com/plugins/rcarriga/nvim-notify)
- [kevinhwang91/nvim-ufo](https://dotfyle.com/plugins/kevinhwang91/nvim-ufo)
- [folke/noice.nvim](https://dotfyle.com/plugins/folke/noice.nvim)
- [echasnovski/mini.animate](https://dotfyle.com/plugins/echasnovski/mini.animate)

## Language Servers

- clangd
- cssls
- emmet_ls
- eslint
- html
- jdtls
- lua_ls
- marksman
- pyright
- rust_analyzer
- sqls
- tailwindcss
- tsserver
- vtsls

This readme was generated by [Dotfyle](https://dotfyle.com)
