" \m at any point will open the doc in marked.app
:nnoremap <leader>m :silent !open -a Marked\ 2.app '%:p'<cr>

" enable spell check
:setlocal spell spelllang=en_gb

" fixup a table -- must position cursor before the table.
nmap <leader>t !}~/.vim/scripts/norm_table.py<CR>

" fixup headings
nmap <leader>h :%!~/.vim/scripts/norm_hdrs.py<CR>'0
