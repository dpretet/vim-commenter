"---------------------------------------------------------------
" Plugin:      https://github.com/dpretet/vim-commenter
" Description: A plugin to comment a bulk of code lines
" Maintainer:  Damien Pretet https://github.com/dpretet
"---------------------------------------------------------------

if exists('loaded_commenter_vim') || &cp
    finish
endif

let loaded_commenter_vim = 1

" Save compatible mode
let s:save_cpo = &cpo
" Reset compatible mode to default value
set cpo&vim

" Next initialize the variable if not specified by user
" None for the moment...

" Declare startup command
command! -nargs=* -range Commenter call commenter#start(<line1>,<line2>)

" Restore compatible mode
let &cpo = s:save_cpo
unlet s:save_cpo
