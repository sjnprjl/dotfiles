let BASE = $HOME
let template = BASE . "/Templates/templates.cpp"


function! FileExists(path)
    if filereadable(expand(a:path))
        exe "au BufNewFile *.cpp 0read " . fnameescape(a:path)
    else
        echo "Not found file"
    endif
endfunction

call FileExists(template)

