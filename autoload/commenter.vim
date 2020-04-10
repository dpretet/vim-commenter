"---------------------------------------------------------------
" Plugin:      https://github.com/damofthemoon/vim-commenter
" Description: A plugin to comment a bulk of code lines
" Maintainer:  Damien Pretet https://github.com/damofthemoon
"---------------------------------------------------------------

" Save compatible mode
let s:save_cpo = &cpo
" Reset compatible mode to default value
set cpo&vim

" Comment symbol by language
let s:comment_symbol = {
   \   "c": '\/\/',
   \   "cpp": '\/\/',
   \   "javascript": '\/\/',
   \   "lua": '--',
   \   "vhdl": '--',
   \   "python": '#',
   \   "rust": '\/\/',
   \   "verilog": '\/\/',
   \   "systemverilog": '\/\/',
   \   "sh": '#',
   \   "conf": '#',
   \   "profile": '#',
   \   "zshrc": '#',
   \   "bashrc": '#',
   \   "bash_profile": '#',
   \   "vim": '"',
   \   "vimrc": '"',
   \   "tex": '%',
   \ }

" Startup function to call the plugin from user land
function! commenter#start(...)

    if ! has_key(s:comment_symbol, &filetype)
        echo "INFO: vim-commenter: filetype is not supported"
        return
    endif

    call s:Commenter(a:1, a:2)
    return

endfunction

" Function to toggle comment of a selection of lines
" Only works if selected with visual mode
function! s:Commenter(start, end)

    echo a:start
    echo a:end

    " Grab comment symbol to use
    let _comment = s:comment_symbol[&filetype]

    for lnum in range(a:start,a:end)

        let line = getline(lnum)

        " Uncomment
        if match(getline(line), '^\s*'._comment) > -1
             execute 's/\v(^\s*)'.escape(_comment, '\/').'\v\s*/\1/e'
        " Comment
        else
            execute 's/^\s*/&'.escape(_comment, '\/').' /e'
        endif
    endfor

endfunction

" Restore compatible mode
let &cpo = s:save_cpo
unlet s:save_cpo
