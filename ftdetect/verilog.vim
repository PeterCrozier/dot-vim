" verilog header files, .v files are handled as verilog in vim 7+
" syntastic uses filetype to enable checkers and it does not know about
" systemverilog so need to set g:syntastic_filetype_map = { "systemverilog": "verilog"}
autocmd BufRead,BufNewFile *.v set filetype=systemverilog
autocmd BufRead,BufNewFile *.vh set filetype=systemverilog
