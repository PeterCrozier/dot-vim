" VIM syntax file for vasm 6502 old style syntax with dotdir set
" Language: s65
"
"
" quit when a syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

" Note: the last match takes precedence
"
" Remove any old syntax stuff hanging about
syn clear
syn case ignore

" Symbols
syn match s65symbol	"[a-z][a-z0-9]*"

" Labels
syn match s65label	"[a-z][a-z0-9]*:"
syn match s65local	"\.[a-z][a-z0-9]*:"

" Opcodes
syn keyword s65opcode
 \ ADC AND ASL BCC BCS BEQ BIT BMI BNE BPL BRK BVC BVS CLC CLD CLI CLV CMP CPX
 \ CPY DEC DEX DEY EOR INC INX INY JMP JSR LDA LDX LDY LSR NOP ORA PHA PHP PLA
 \ PLP ROL ROR RTI RTS SBC SEC SED SEI STA STX STY TAX TAY TSX TXA TXS TYA

" WDC W65C02S extensions
syn keyword s65ext
 \ BRA PHX PHY PLX PLY STP STZ TRB TSB WAI


syn case match

" Directives

syn match s65dir	"\(^\|\s\)\.align\($\|\s\)"
syn match s65dir	"\(^\|\s\)\.asciiz\($\|\s\)"
syn match s65dir	"\(^\|\s\)\.bss\($\|\s\)"
syn match s65dir	"\(^\|\s\)\.byte\($\|\s\)"
syn match s65dir	"\(^\|\s\)\.data\($\|\s\)"
syn match s65dir	"\(^\|\s\)\.org\($\|\s\)"
syn match s65dir	"\(^\|\s\)\.text\($\|\s\)"
syn match s65dir	"\(^\|\s\)\.word\($\|\s\)"

" Macros
syn match s65macro	"\(^\|\s\)\.endmacro\($\|\s\)"
syn match s65macro	"\(^\|\s\)\.macro\($\|\s\)"

" Preprocessor
syn match s65precond	"\(^\|\s\)\.if\($\|\s\)"
syn match s65precond	"\(^\|\s\)\.ifdef\($\|\s\)"
syn match s65precond	"\(^\|\s\)\.else\($\|\s\)"
syn match s65precond	"\(^\|\s\)\.endif\($\|\s\)"

syn match s65inc	"\(^\|\s\)\.include\($\|\s\)"

syn case ignore

" Numbers
syn match s65number	"#\=[0-9]*\>"
syn match s65number	"#\=$[0-9A-F]*\>"
syn match s65number	"#\=&[0-7]*\>"
syn match s65number	"#\=%[01]*\>"

" Strings
syn match s65string	"\".*\""

" HI/LO Byte
syn region s65hilo	start="#[<>]" end="$\|\s" contains=s65comment keepend

" Comments
syn keyword s65todo	TODO XXX FIXME BUG contained
syn match   s65comment	";.*"hs=s+1 contains=s65todo


" Define the default highlighting.
" Only when an item doesn't have highlighting yet

hi def link s65comment	Comment
hi def link s65precond	PreCondit
hi def link s65number	Number
hi def link s65string	String
hi def link s65dir	Statement
hi def link s65opcode	Type
hi def link s65ext	Type
hi def link s65todo	Todo
hi def link s65hilo	Number
hi def link s65label	Function
hi def link s65local	None
hi def link s65symbol	None
hi def link s65macro	Macro
hi def link s65inc	Include

let b:current_syntax = "s65"


