"---------------------------------------------------------------
" Plugin:      https://github.com/dpretet/vim-commenter
" Description: A plugin to comment a bulk of code lines
" Maintainer:  Damien Pretet https://github.com/dpretet
"---------------------------------------------------------------

" Save compatible mode
let s:save_cpo = &cpo
" Reset compatible mode to default value
set cpo&vim

" Comment symbol by language
let s:comment_symbol = {
   \   "c": '//',
   \   "cpp": '//',
   \   "javascript": '//',
   \   "lua": '--',
   \   "vhdl": '--',
   \   "yaml": '#',
   \   "python": '#',
   \   "tcl": '#',
   \   "rust": '//',
   \   "verilog": '//',
   \   "systemverilog": '//',
   \   "verilog_systemverilog": '//',
   \   "sh": '#',
   \   "conf": '#',
   \   "profile": '#',
   \   "zshrc": '#',
   \   "zsh": '#',
   \   "bashrc": '#',
   \   "bash_profile": '#',
   \   "vim": '"',
   \   "vimrc": '"',
   \   "tex": '%',
   \   "makefile": '#',
   \ }

" Startup function to call the plugin from user land
function! commenter#start(...)

    if ! has_key(s:comment_symbol, &filetype)
        echo "INFO: vim-commenter: filetype is not supported"
        return
    endif

    if g:leaderMapperLineStart != -1
        let start = g:leaderMapperLineStart
    else
        let start = a:1
    endif

    if g:leaderMapperLineEnd != -1
        let end = g:leaderMapperLineEnd
    else
        let end = a:2
    endif

    call s:comment(start, end)
    return

endfunction


" Function to toggle comment of a selection of lines
" Only works if selected with visual mode
function! s:comment(start, end)

    " Grab comment symbol to use
    let symbol = s:comment_symbol[&filetype]

    for lnum in range(a:start,a:end)
        " If don't find comment sympbol at line start, comment
        if match(getline(lnum), '^\s*'.symbol) == -1
            execute lnum.'s/^\s*/&'.escape(symbol, '\/').' /e'
        " Else uncomment the line
        else
            execute lnum.'s/\v(^\s*)'.escape(symbol, '\/').'\v\s*/\1/e'
        endif
    endfor

endfunction

" Restore compatible mode
let &cpo = s:save_cpo
unlet s:save_cpo
