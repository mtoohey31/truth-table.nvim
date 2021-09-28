# `truth-table.nvim`

A tiny lua plugin for generating [truth tables](https://en.wikipedia.org/wiki/Truth_table) in Neovim.

## Usage

```vim
call plug#begin()

Plug 'mtoohey31/truth-table.nvim'

call plug#end()

" In a buffer of no specific filetype, prompt the user to input the separator
nmap <LocalLeader>t <CMD>lua require('truth_table')(vim.fn.input("separator: "))<CR>
" In a markdown buffer, use ' | ' for the separator
autocmd FileType markdown nmap <buffer> <LocalLeader>t <CMD>lua require('truth_table')(" | ")<CR>
```

Best served with one of:

- [vim-table-mode](https://github.com/dhruvasagar/vim-table-mode)
- [coc-prettier](https://github.com/neoclide/coc-prettier)
- another lsp provider such as [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) + [diagnostic-languageserver + prettier](https://github.com/iamcco/diagnostic-languageserver/wiki/Formatters#prettier)
