-- All custom snipit
require("luasnip.loaders.from_vscode").lazy_load() 

vim.cmd [[
set mouse-=a
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
]]

