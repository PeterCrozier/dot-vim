" Put stuff specifically to do with GUI Macvim in .gvimrc 
" as .gvimrc is loaded after this file by that program only.
"
set autoindent
set history=10
set nomodeline

" search options
set ignorecase smartcase

" make default buffer same as clipboard
set clipboard+=unnamed

" keyboard maps
" F12 for next error in normal mode
map <F12> <ESC>:cn<CR>
" CTRL-C to copy in visual mode
vmap <C-C>	"*y

" map \d to run Dash via the Dash.vim plugin
:nmap <silent> <leader>d <Plug>DashSearch
:nmap <silent> <leader>D <Plug>DashGlobalSearch

" turn on syntax coloring and filetype detection
syntax on
filetype on

" don't create .netrwhist file if you edit a directory file
let g:netrw_dirhistmax = 0

" pathogen support
" Run :Helptags to add local help docs from ~/.vim/bundle if you add/change any plugins
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()
filetype plugin indent on

function SetTabs ()
" These tests have to be in an au command function called per buffer/window
if &filetype == "c" || &filetype == "cpp" || &filetype == "arduino" || &filetype == "verilog" || &filetype == "systemverilog"
	" C specifics, default fo=croql
	setlocal formatoptions-=o	" don't autocomment new lines added with o or O
	setlocal formatoptions+=j	" join comments sensibly
	setlocal comments=sl:/*,mb:**,ex:*/,:// 
	setlocal commentstring=//\	%s
elseif &filetype == "ruby"
	" Ruby specifics
	setlocal ts=2 bs=2 shiftwidth=2 smarttab expandtab
	setlocal formatoptions-=o	" don't autocomment new lines added with o or O
	setlocal formatoptions+=j	" join comments sensibly
elseif &filetype == "haml"
	" HAML specifics
	setlocal ts=2 bs=2 shiftwidth=2 smarttab expandtab
elseif &filetype == "scala"
	" Scala specifics
	setlocal ts=2 bs=2 shiftwidth=2 smarttab expandtab
elseif &filetype == "swift"
	" Swift specifics, defaults to 2 soft spaces, use hard tabs
	" using pathogen bundle: https://github.com/Keithbsmiley/swift.vim
	setlocal ts=8 shiftwidth=0 softtabstop=0 nosmarttab noexpandtab
	setlocal commentstring=//\	%s
endif
if &filetype == "verilog" || &filetype == "systemverilog"
	" the built-in syntax wraps at 78
	setlocal textwidth=0
endif
endfunction
autocmd BufEnter * call SetTabs()

" CoffeeScript override, ftplugin sets expandtab and shiftwidth
autocmd BufRead,BufNewFile *.coffee setlocal expandtab smarttab shiftwidth=2 ts=2
" show coffee errors from make
" autocmd QuickFixCmdPost * nested cwindow 

" highlight trailing spaces in Ruby and C like languages
let c_space_errors=1
let ruby_space_errors=1


" Octave/Matlab syntax overriding Objective C
function MatTabs ()
if &filetype == "matlab"
	set ts=4 shiftwidth=4 expandtab
endif
endfunction
autocmd BufRead,BufNewFile *.m,*.oct call MatTabs ()

" Unicode editing
if has("multi_byte")
     set encoding=utf-8
     setglobal fileencoding=utf-8
     set fileencodings=utf-8,ucs-bom,iso-8859-15,iso-8859-3
else
     "echoerr "Sorry, this version of (g)vim was not compiled with +multi_byte"
endif 

" these are common dyslexic misspellings
iab teh the
iab statment statement

" Restore cursor position in the irb vim gem. XXX Do we need this?
if has("autocmd")
  " Restore cursor position
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
endif

" support ctags if available
" search current dir then move up until vim finds one
set tags=./tags,tags;

" run clang-format via CTRL-K TODO C,C++ only?
" formats current line in normal mode or the selected region in visual mode
"map <C-K> :pyfile /usr/local/bin/clang-format.py<cr><cr>

" fancy matching begin/end in verilog, ruby etc.
" included as a macro in vim 6.0+
runtime macros/matchit.vim


" force status line on all windows
set laststatus=2
set ruler

" make status line change colour with mode
function! InsertStatuslineColor(mode)
	if a:mode == 'i'	" insert mode
    		highlight StatusLine guibg=LightRed ctermfg=5 guifg=Black ctermbg=0
	elseif a:mode == 'r'	" replace mode
    		highlight StatusLine guibg=Red ctermfg=5 guifg=Black ctermbg=0
	else
    		highlight StatusLine guibg=Cyan ctermfg=5 guifg=Black ctermbg=0
	endif
endfunction

au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertChange * call InsertStatuslineColor(v:insertmode)
au InsertLeave * highlight StatusLine guibg=DarkGreen ctermfg=8 guifg=White ctermbg=15

" default the statusline to green initially
highlight StatusLine guibg=DarkGreen ctermfg=8 guifg=White ctermbg=15
" colour for inactive split screen
highlight StatusLineNC guibg=Grey ctermfg=8 guifg=White ctermbg=15



" syntastic flags
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++14 -stdlib=libc++'
" syntastic does not understand systemverilog filetype
let g:syntastic_filetype_map = { "systemverilog": "verilog" }
"let g:syntastic_verilog_checkers = ['iverilog']


"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

" ultisnips snippet library
let g:UltiSnipsExpandTrigger		= "<C-J>"
let g:UltiSnipsListSnippets		= "<C-L>"
let g:UltiSnipsJumpForwardTrigger	= "<TAB>"
let g:UltiSnipsJumpBackwardTrigger	= "<C-TAB>"
let g:ultisnips_python_style="doxygen"
let g:UltiSnipsEnableSnipMate=0
let g:UltiSnipsSnippetsDir="~/.vim/UltiSnips"
