" bases
nn <silent> <localleader>cb :call CocLocations('ccls','$ccls/inheritance')<cr>
" bases of up to 3 levels
nn <silent> <localleader>cB :call CocLocations('ccls','$ccls/inheritance',{'levels':3})<cr>
" derived
nn <silent> <localleader>cd :call CocLocations('ccls','$ccls/inheritance',{'derived':v:true})<cr>
" derived of up to 3 levels
nn <silent> <localleader>cD :call CocLocations('ccls','$ccls/inheritance',{'derived':v:true,'levels':3})<cr>

" caller
nn <silent> <localleader>cc :call CocLocations('ccls','$ccls/call')<cr>
" callee
nn <silent> <localleader>cC :call CocLocations('ccls','$ccls/call',{'callee':v:true})<cr>

" $ccls/member
" member variables / variables in a namespace
nn <silent> <localleader>cm :call CocLocations('ccls','$ccls/member')<cr>
" member functions / functions in a namespace
nn <silent> <localleader>cf :call CocLocations('ccls','$ccls/member',{'kind':3})<cr>
" nested classes / types in a namespace
nn <silent> <localleader>cs :call CocLocations('ccls','$ccls/member',{'kind':2})<cr>

nmap <silent> <localleader>ct <Plug>(coc-type-definition)<cr>
nn <silent> <localleader>cv :call CocLocations('ccls','$ccls/vars')<cr>
nn <silent> <localleader>cV :call CocLocations('ccls','$ccls/vars',{'kind':1})<cr>

:let g:gtest#highlight_failing_tests = 1
:GTestRun
:GTestHighlight

nn <leader>tt :GTestRunUnderCursor<cr>
nn <leader>ta :GTestNewTest<cr>
