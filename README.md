Container implementing an environment for vim editor supporting the following plugins:

### [ctrlp](https://github.com/ctrlpvim/ctrlp.vim)
> Full path fuzzy file, buffer, mru, tag, ... finder for Vim.


### [nerdtree](https://github.com/preservim/nerdtree)
> The NERDTree is a file system explorer for the Vim editor.

### [vim-airline](https://github.com/vim-airline/vim-airline)
> Lean & mean status/tabline for vim that's light as air.

### [coc](https://github.com/neoclide/coc.nvim)
> Nodejs extension host for vim & neovim, load extensions like VSCode and host language servers.

### [vim-gutentags](https://github.com/ludovicchabant/vim-gutentags)
> Gutentags is a plugin that takes care of the much needed management of tags files in Vim.

### [targbar](https://github.com/preservim/tagbar)
> Tagbar is a Vim plugin that provides an easy way to browse the tags of the current file and get an overview of its structure. 

Supported languages:
* Golang (`vim-go`)
    * Autocompletion via `coc-go`
    * `golangci-lint`

* Rust (`rust.vim`)


# Basic shortcuts

## Development
* Autocompletion: `<C-x><C-o>`
* Run code: `<C-r>`
* Vertical split of current buffer: `<C-s>`

## Code navigation
* List open buffers: `<C-l>`
* Buffers tab: `<C-b>`
* Tags tab: `<C-a>`
* File search tab (ctrlp): `<C-p>`
* Jump to definition: `Ctrl + Left` 
* Jump to previous focus: `<C-o>`
* Tagbar: `F8`
