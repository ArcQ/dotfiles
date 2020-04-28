
let g:LanguageClient_diagnosticsEnable=0
nmap gd :ImportJSGoto<cr>

command! -nargs=0 Prettier :CocCommand prettier.formatFile
nmap gqa :Prettier<cr>

let g:jsdoc_underscore_private=1
let g:jsdoc_enable_es6=1

let g:javascript_plugin_jsdoc = 1
nmap <silent> <localleader>d ?function<cr>:noh<cr><Plug>(jsdoc)
