let g:LanguageClient_diagnosticsEnable=0
map <silent> <localleader>t :Require <CR>:Eval (clojure.test/run-tests)<CR>
