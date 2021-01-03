" VIM syntax file extendeding builtin a65 to add missing keywords
" Language: s65
"
" s65 is for vasm 6502 old style syntax
"
" quit when a syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

" Read the a65 syntax to start with
runtime! syntax/a65.vim
unlet b:current_syntax

" s65 extentions
syn case ignore

syn match a65Opcode	"\<STP\($\|\s\)"
syn match a65Opcode	"\<TSB\($\|\s\)" nextgroup=a65Address

syn case match

syn match a65Type	"\(^\|\s\)\.org\($\|\s\)"
syn match a65Type	"\(^\|\s\)\.byte\($\|\s\)"
syn match a65Type	"\(^\|\s\)\.asciiz\($\|\s\)"
syn match a65Type	"\(^\|\s\)\.macro\($\|\s\)"
syn match a65Type	"\(^\|\s\)\.endmacro\($\|\s\)"

syn match a65PreProc	"\(^\|\s\)\.if\($\|\s\)"
syn match a65PreProc	"\(^\|\s\)\.ifdef\($\|\s\)"
syn match a65PreProc	"\(^\|\s\)\.else\($\|\s\)"
syn match a65PreProc	"\(^\|\s\)\.endif\($\|\s\)"

let b:current_syntax = "s65"


