" Vim syntax file
" Language: SMIPS assembler, i.e. .sm or .smips extension
" Maintainer: pjc
" Latest Revision: 2016-03-03 22:05:26 +0000

if exists("b:current_syntax")
  finish
endif

setlocal iskeyword+=-
syn case match

syn region mipsString start=/"/ end=/"/
syn match mipsLabelColon /:/ contained
syn match mipsLabel /[a-zA-Z0-9_]*:/ contains=mipsLabelColon
syn match mipsNumber /\<[-]\?[0-9]*\>/
syn match mipsNumber /0x[0-9A-Fa-f]*/
syn match mipsComment /#.*$/ contains=todo
syn match mipsPreproc /^#define.*$/
syn match mipsPreproc /^#include.*$/
syn match mipsPreproc /^#if.*$/
syn match mipsPreproc /^#endif.*$/
syn match mipsPreproc /^#elsif.*$/
syn match mipsComment /\/\/.*$/ contains=todo
syn keyword todo contained TODO
syn match mipsMacroArg /%[a-zA-Z][a-zA-Z0-9]*\>/

syn match mipsRegister "$zero"
syn match mipsRegister "$at"
syn match mipsRegister "$v0"
syn match mipsRegister "$v1"
syn match mipsRegister "$a0"
syn match mipsRegister "$a1"
syn match mipsRegister "$a2"
syn match mipsRegister "$a3"
syn match mipsRegister "$t8"
syn match mipsRegister "$t9"
syn match mipsRegister "$k0"
syn match mipsRegister "$k1"
syn match mipsRegister "$gp"
syn match mipsRegister "$sp"
syn match mipsRegister "$fp"
syn match mipsRegister "$ra"
syn match mipsRegister "$t0"
syn match mipsRegister "$s0"
syn match mipsRegister "$t1"
syn match mipsRegister "$s1"
syn match mipsRegister "$t2"
syn match mipsRegister "$s2"
syn match mipsRegister "$t3"
syn match mipsRegister "$s3"
syn match mipsRegister "$t4"
syn match mipsRegister "$s4"
syn match mipsRegister "$t5"
syn match mipsRegister "$s5"
syn match mipsRegister "$t6"
syn match mipsRegister "$s6"
syn match mipsRegister "$t7"
syn match mipsRegister "$s7"

syn match mipsRegister "$0"
syn match mipsRegisterWarn "$1"
syn match mipsRegisterWarn "$2"
syn match mipsRegisterWarn "$3"
syn match mipsRegisterWarn "$4"
syn match mipsRegisterWarn "$5"
syn match mipsRegisterWarn "$6"
syn match mipsRegisterWarn "$7"
syn match mipsRegisterWarn "$8"
syn match mipsRegisterWarn "$9"
syn match mipsRegisterWarn "$10"
syn match mipsRegisterWarn "$11"
syn match mipsRegisterWarn "$12"
syn match mipsRegisterWarn "$13"
syn match mipsRegisterWarn "$14"
syn match mipsRegisterWarn "$15"
syn match mipsRegisterWarn "$16"
syn match mipsRegisterWarn "$17"
syn match mipsRegisterWarn "$18"
syn match mipsRegisterWarn "$19"
syn match mipsRegisterWarn "$20"
syn match mipsRegisterWarn "$21"
syn match mipsRegisterWarn "$22"
syn match mipsRegisterWarn "$23"
syn match mipsRegisterWarn "$24"
syn match mipsRegisterWarn "$25"
syn match mipsRegisterWarn "$26"
syn match mipsRegisterWarn "$27"
syn match mipsRegisterWarn "$28"
syn match mipsRegisterWarn "$29"
syn match mipsRegisterWarn "$30"
syn match mipsRegisterWarn "$31"


syn match mipsDirective "\.end"
syn match mipsDirective "\.space"
syn match mipsDirective "\.align"
syn match mipsDirective "\.data"
syn match mipsDirective "\.text"
syn match mipsDirective "\.dword"
syn match mipsDirective "\.word"
syn match mipsDirective "\.half"
syn match mipsDirective "\.byte"
syn match mipsDirective "\.globl"
syn match mipsDirective "\.extern"
syn match mipsDirective "\.eqv"
syn match mipsDirective "\.reorder"
syn match mipsDirective "\.noreorder"
syn match mipsDirective "\.nomacro"
syn match mipsDirective "\.include"
syn match mipsDirective "\.macro"
syn match mipsDirective "\.endm"

syn keyword mipsInstruction lw sw addi addiu slti sltiu andi ori xori lui syscall break sllv srlv srav mfhi mthi mflo mtlo mult multu div divu add addu subu sub and or xor nor slt sltu sll srl sra j jal jr jalr mfc0 mtc0 eret beq bne blez bgtz bltz bgez
syn keyword mipsAlias nop move clear not b bal beqz bnez li la bgt blt bge ble

hi def link mipsComment             Comment
hi def link mipsNumber              Number
hi def link mipsString              String
hi def link mipsLabel               Label
hi def link mipsRegister            Identifier
hi def link mipsRegisterWarn        Underlined
hi def link mipsDirective           Type
hi def link mipsInstruction         Statement
hi def link mipsAlias               mipsInstruction
hi def link mipsPseudoInstruction   PreProc
hi def link mipsMacroArg            Macro
hi def link mipsPreproc             Macro
hi def link todo                    ToDo

let b:current_syntax = "smips"
