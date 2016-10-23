au BufNewFile,BufRead *.sm set filetype=smips
au FileType smips call AssemblyConfig() 

function! AssemblyConfig()
	setlocal autoindent
	setlocal softtabstop=8
	setlocal tabstop=8
	setlocal noexpandtab
	retab
  setlocal comments=b:#
  setlocal formatoptions+=ro
  setlocal include=^\s*\.include
endfunction
