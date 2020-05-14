" also loaded for cpp
" reformats current line in normal mode or the selected region in visual mode
"map <C-K> :pyfile ~/.vim/scripts/clang-format.py<cr><cr>
" Now using the homebrew installed script to be consistent
map <C-K> :py3file /usr/local/share/clang/clang-format.py<cr><cr>

" autocomplete braces
inoremap {<CR> {<CR>}<C-o>O

