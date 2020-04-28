autocmd BufRead,BufNewFile *.cljs setlocal filetype=clojure
autocmd BufRead,BufNewFile *.js setlocal filetype=javascript.jsx
autocmd BufRead,BufNewFile *.h setlocal filetype=cpp
autocmd BufRead,BufNewFile build.boot setlocal filetype=clojure
au BufRead,BufNewFile *.re set filetype=reason
au BufRead,BufNewFile *.rei set filetype=reason
au BufNewFile,BufRead .merlin       set ft=merlin

call plug#begin('~/.local/share/nvim/plugged')

set nocompatible              " be iMproved, required

" General Plugs
Plug 'tpope/vim-fugitive'
Plug 'w0rp/ale'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'jpalardy/vim-slime'
Plug 'vim-scripts/YankRing.vim'
Plug 'mgedmin/python-imports.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Non essential
Plug 'tpope/vim-projectionist'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-dispatch'

" Javascript plugins
Plug 'Galooshi/vim-import-js', { 'for': [] }
" Plug 'Galooshi/vim-import-js', { 'for': ['javascript', 'javascript.jsx', 'javascriptreact'] }
Plug 'heavenshell/vim-jsdoc', { 'for': ['javascript', 'javascript.jsx', 'javascriptreact'] }

" Rust plugins
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'

" Python plugins
Plug 'janko/vim-test', {'for': 'python'}
Plug 'tpope/vim-dispatch', {'for': 'python'}

" c++ plugins
Plug 'vim-scripts/DoxygenToolkit.vim', {'for': 'cpp'}
Plug 'stevearc/vim-arduino', {'for': 'cpp'}
Plug 'alepez/vim-gtest', {'for': 'cpp'}


" Clojure plugins
Plug 'tpope/vim-surround', { 'for': ['javascript', 'javascript.jsx', 'javascriptreact', 'clojure', 'cpp'] }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'luochen1990/rainbow', { 'for': 'clojure' }
Plug 'eraserhd/parinfer-rust', {'do': 'cargo build --release'}

Plug 'tpope/vim-repeat', { 'for': 'clojure' }
Plug 'guns/vim-sexp', { 'for': 'clojure' }
Plug 'tpope/vim-sexp-mappings-for-regular-people', { 'for': 'clojure' }

Plug 'sheerun/vim-polyglot'

" Initialize plugin system
call plug#end()
filetype plugin indent on    " required

:command! On on

" issues with phoenix reloading because vim is interferring during lint on
" save? https://elixirforum.com/t/vim-interfering-with-phoenix-recompile-after-saving/10039/18
let $MIX_ENV = 'test'

"----------------------------
"""" Basic Settings""""
"----------------------------

"----leader settings----
nnoremap <Space> <Nop>
let mapleader=","
let maplocalleader=" "
let maplocalleader="\<space>"
set clipboard=unnamed

"update file sometimes to trigger lint
nnoremap <leader>ee :edit<cr>:w<cr>

" hi! EndOfBuffer ctermbg=bg ctermfg=bg guibg=bg guifg=bg

"----basic settings----
"for terminal mode inside nvim
"don't delete from clipboard after pasting
xnoremap p pgvy
set numberwidth=1
tnoremap <Esc> <C-\><C-n>
syntax enable
set ffs=unix,dos,mac " Use Unix as the standard file type
set encoding=utf8 " Set utf8 as standard encoding and en_US as the standard language
" Configure backspace so it acts as it should act
set backspace=2
set backspace=indent,eol,start

if !has('nvim')
  fixdel
endif
" no timeout on leader key
set ttimeout

" Persistent Undo
" tell it to use an undo file
set undofile
" set a directory to store the undo history
set undodir=/Users/eddielaw/.vim/.vimundo/

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

"share the main mac clipboard
"set clipboard=unnamed
set splitright
set splitbelow

"----search settings----
set ignorecase
set smartcase
:set hlsearch "highlight all search results after a search
" clear last seach with leader space
nnoremap <leader><space> :noh<cr>

"----indent settings----
set nocindent
set nosmartindent
set noautoindent
set tabstop=2
set shiftwidth=2
set expandtab

"----status line----
set laststatus=2 " Always show the status line
highlight User1   gui=NONE guifg=#ff0000 guibg=#d0d0e0
" Format the status line
set statusline=\ %F%1*%m%*%r%h\ %w\ ln%l:%c
set statusline+=%#warningmsg#
set statusline+=%*

"----other tweaks----
"

" quick editing the vimrc (and sourcing it, and if you want, auto sourcing after saving)
nnoremap <silent> <leader>ev :tabedit $MYVIMRC<CR>
nnoremap <silent> <leader>ec :CocConfig<CR>
nnoremap <leader>sv :so $MYVIMRC<CR>
"quick editing for end of day notes
nnoremap <leader>ed :tabedit ~/Development/eodnotes.md<CR>

nnoremap <leader>z :tabedit %<CR>


" for when you accidentally capitalize W when typing :w to save
:command! W w
:command! Q w
:command! Wq wq
:command! WQ wq

" Remember cursor position between vim sessions
autocmd BufReadPost *
      \ if line("'\"") > 0 && line ("'\"") <= line("$") |
      \   exe "normal! g'\"" |
      \ endif

" center buffer around cursor when opening files
autocmd BufRead * normal zz
" autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o " turn of auto-comments on new-line

" Remove Error Bells
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Filetype Specific
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"----------------------------
"""" psql stuffs
"----------------------------
let g:sql_type_default = 'pgsql'

"----------------------------
"""" clojure stuffs """"
"----------------------------
let g:rainbow_active = 1
let g:rainbow_conf = {
      \	'ctermfgs': ['lightblue', 'lightyellow', 'darkgreen', 'darkyellow', 'yellow', 'cyan', 'magenta', 'white'],
      \}
autocmd FileType clojure nmap <leader>el :%Eval<CR>
autocmd FileType clojure nmap <leader>g :Require <bar> :Eval (clojure.spec.test.alpha/instrument)<CR><CR>
" autocmd BufWrite *[^test].clj :silent exec "%Eval"
" autocmd BufWrite *.clj :silent exec "%Eval"
autocmd BufWrite *.clj :silent exec "%Eval"
autocmd FileType clojure nmap cpf :normal vafYP<CR>

" au BufNewFile,BufRead *.clj RainbowToggle
"
" ---rust settings ---
set hidden
let g:racer_cmd = "/home/user/.cargo/bin/racer"

"----javascript settings----
"
let g:vimjs#casesensistive = 1
let g:vimjs#smartcomplete = 1
set completeopt-=preview
" run vim-jsx in js files
let g:jsx_ext_required = 0

""--cpp settings--
autocmd FileType cpp nmap <localleader>d :Dox<CR>

"----python settings----
" Delete Trailing Spaces for Python
"
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.js :call DeleteTrailingWS()
" for pyenv
let g:python3_host_prog = '/Users/eddielaw/.pyenv/versions/neovim3/bin/python'

let g:parinfer_mode = 'smart'
let g:sexp_enable_insert_mode_mappings = 0

"---ocaml settings ---

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Appearance Specific
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme onedark
hi Normal ctermbg=NONE
:set nowrap
:set textwidth=0
:set wrapmargin=0
set showmatch " Show matching brackets when text indicator is over them
hi MatchParen cterm=bold ctermbg=black ctermfg=red

" Changing line numbers
set rnu
set nonu
function! NumberToggle()
  if(&rnu == 1)
    set nornu
  else
    set rnu
  endif
endfunc
nnoremap <leader>n :call NumberToggle()<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"----splits----
" Easier way to move between splits
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l
" Increase and Decrease Split Size
nnoremap + 40<c-w>>
nnoremap - 40<c-w><
" Note Alt key mappings on mac without setting meta key
map <C-t>p :tabp<cr>
map <C-t>n :tabn<cr>
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving Commands to remember
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " delete all buffers
" :bufdo bd
" :bd
" :bn
" :bp
" " Useful mappings for managing tabs
" :tabnew
" :tabclose
" :marks
" :tabr
" :tabl
"
" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif
" Remember info about open buffers on close
set viminfo^=%

"----------------------------
"""" Plugin Specific """"
"----------------------------
" vim slime
let g:slime_target = "tmux"
let g:slime_paste_file = "$HOME/.slime_paste"
let g:slime_dont_ask_default = 1
let g:slime_default_config = {"socket_name": "default", "target_pane": "{right-of}"}

let g:slime_no_mappings = 1
xmap <leader>ss <Plug>SlimeRegionSend
nmap <leader>sp <Plug>SlimeParagraphSend
nmap <leader>sc <Plug>SlimeConfig

" "----ale settings----
let g:ale_linters = {'rust': ['rls','cargo','rustc'], 'python': ['flake8'], 'cpp': ['clangtidy'], 'c': [], 'javscript': ['eslint', 'prettier'], 'javscriptreact': ['eslint', 'prettier']}
let g:ale_fixers = { 'python': ['autopep8', 'yapf'], 'rust': ['rustfmt'], '*': ['remove_trailing_lines', 'trim_whitespace'], 'javascriptreact': ['eslint', 'prettier'], 'javascript': ['eslint', 'prettier'], 'cpp': ['clang-format', 'clangtidy'] }
let g:ale_c_parse_compile_commands = 1
let g:ale_c_build_dir_names = ['build', 'bin']
let g:ale_c_parse_makefile = 1

let g:ale_echo_msg_format = '%linter% says %s'
" let g:ale_cpp_clangtidy_options = '-I/Users/eddielaw/Development/scripts/emsdk/upstream/emscripten/system/include/ -std=c++17'
" let g:ale_cpp_clangtidy_extra_options = '-isystem /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include/c++/v1 -I/Users/eddielaw/Development/scripts/emsdk/upstream/emscripten/ -I/Users/eddielaw/Development/scripts/emsdk/upstream/emscripten/system/include/ -std=c++17'
" let g:ale_cpp_clangtidy_extra_options = '-isystem /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include/c++/v1'
" let g:ale_cpp_clang_executable = '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang'
let g:ale_cpp_clang_options = '-std=c++17 -isystem /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include/c++/v1 -I/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/ -I/Users/eddielaw/Development/scripts/emsdk/upstream/emscripten/system/include/'
" let g:ale_cpp_clangtidy_checks = ['*']
let g:ale_history_enabled  = 1
let g:ale_history_log_output = 1

let g:ale_rust_rls_executable = '/home/user/.cargo/bin/'
let g:ale_rust_rls_toolchain = 'stable'
let g:ale_completion_enabled = 1
let g:ale_sign_error = "✗"
let g:ale_sign_warning = "⚠"
highlight ALEError ctermbg=52
highlight ALEWarning ctermbg=58
highlight ALEVirtualTextError ctermfg=235 guifg=#262626 "rgb=38,38,38
highlight ALEVirtualTextInfo ctermfg=235 guifg=#262626 "rgb=38,38,38
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_enter = 1
let g:ale_virtualtext_cursor = 1
let g:ale_fix_on_save = 1

nmap <silent> <leader>ep <Plug>(ale_previous_wrap)
nmap <silent> <leader>en <Plug>(ale_next_wrap)

" Netrw
let g:netrw_banner = 0
let g:netrw_winsize = 25

let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_altv = 1
let g:netrw_winsize = 25
let g:netrw_list_hide= '*.pyc,*.o,*.obj,*.svn,*.swp,*.class,*.hg,*.DS_Store,*.min.*,__pycache__,*pytest_cache'
" map <leader>\ :Explore<CR>
" map <leader>/ :Explore<CR>


" NERDTree settings
set wildignore+=*.pyc,*.o,*.obj,*.svn,*.swp,*.class,*.hg,*.DS_Store,*.min.*,__pycache__,*pytest_cache
map <leader>\ :NERDTreeToggle<CR>
map <leader>/ :NERDTreeFind<CR>
let NERDTreeShowHidden=1
let g:NERDTreeWinSize=40
let g:NERDTreeAutoDeleteBuffer=1
let g:NERDTreeWinPos = "left"
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
let NERDTreeRespectWildIgnore=1

" ack settings
" When you press gv you Ag after the selected text
let g:ack_default_options=' -i --ignore-dir={cmake-build-release,build-debug,build-test,build,packages/game-engine/lib,.eslint,es,venv,game-wasm,battle-wasm,doc,dist,compiled,node-build,es,build-node,target,.shadow-cljs,styleguide,docs,coverage,build-ssr,build-eb-upload,node_modules,build} --ignore-file=match:figwheel_server.log, --ignore-file=match:yarn.lock, --ignore-file=match:package-lock.json, --ignore-file=match:cargo.lock --ignore-file=match:yarn-error.log --ignore-file=match:tags --ignore-file=match:wasm-pack.log --ignore-file=match:compile_commands.json --ignore-file=match:.lein-repl-history'
" let g:ack_autofold_results=1
map <leader>a :Ack!<Space>
" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call SearchReplace('')<CR>

" fzf settings
nmap <Leader>f :GFiles<CR>
nmap <Leader>F :Files<CR>

"vim-test
let test#strategy = "dispatch"

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
" coc
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gu <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>cr <Plug>(coc-rename)
nmap <leader>cr <Plug>(coc-rename)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of current line
nmap <A-cr>  <Plug>(coc-codeaction)
nmap <leader>cf  <Plug>(coc-fix-current)
nmap <leader>cv :CocCommand clangd.switchSourceHeader<cr>

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <localleader>n <Plug>(coc-range-select)
nmap <silent> <localleader>p <Plug>(coc-range-select-backward)


" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')
" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>cc  :<C-u>CocList commands<cr>
nnoremap <silent> <space>co  :<C-u>CocList outline<cr>
nnoremap <silent> <space>cs  :<C-u>CocList -I symbols<cr>
"coc end

" enable autocomplete
" let g:deoplete#enable_at_startup = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => non essential plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" yankring settings
nmap <leader>y :YRShow<CR>
" Fix for YankRing bug
let g:yankring_clipboard_monitor=0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc

function! CmdLine(str)
  exe "menu Foo.Bar :" . a:str
  emenu Foo.Bar
  unmenu Foo
endfunction

""
function! SearchReplace(extra_filter) range
  let l:saved_reg = @"
  exec "normal! vgvy"

  let l:pattern = escape(@", '\\/.*$^~[]')
  let l:pattern = substitute(l:pattern, "\n$", "", "")

  call CmdLine("%s" . '/'. l:pattern . '/')

  let @/ = l:pattern
  let @" = l:saved_reg
endfunction
