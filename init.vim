lua require("init")

augroup aucommands
    au FileType * set colorcolumn=
    au FileType cpp,glsl,c,rust,cs set colorcolumn=120
    au FileType nim set colorcolumn=100
    au FileType markdown,text,plaintex,tex set colorcolumn=120
    au FileType markdown,text,plaintex,tex set textwidth=120
    au FileType markdown,text,plaintex,tex setlocal spell spelllang=en_gb

    au FileType cpp,glsl,c,rust,cs match StatusLineNC /\%120v.\+/
    au FileType nim match StatusLineNC /\%100v.\+/
    au FileType markdown,text match StatusLineNC /\%120v.\+/

    au BufEnter * lua require("utils").telescope_if_git()
    au BufEnter,BufNewFile *.vert,*.frag set syntax=glsl | set filetype=glsl
    au BufEnter,BufNewFile *.slang set filetype=shaderslang

    au BufWritePre * lua vim.lsp.buf.format({ async = false })
augroup END

"function! IsWSL()
"    if has("unix")
"        let lines = readfile("/proc/version")
"        if lines[0] =~ "Microsoft"
"            return 1
"        endif
"    endif
"    return 0
"endfunction
"
"if IsWSL()
"    let g:clipboard = {
"              \   'name': 'win32yank-wsl',
"              \   'copy': {
"              \      '+': 'win32yank.exe -i --crlf',
"              \    },
"              \   'paste': {
"              \      '+': 'win32yank.exe -o --lf',
"              \   },
"              \   'cache_enabled': 0,
"              \ }
"endif
