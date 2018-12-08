" init.vim
"
" Author: Leonardo Mariscal
" Source: https://cav.bz/nvim
" Description: My vimrc for neovim, so init.vim. Grab whatever you want
" Hack: If you have trouble in linux run "dos2unix init.vim"
" Website: http://lmariscal.com/
"
" Resources:
"   vim-plug: https://github.com/junegunn/vim-plug

" Functions {{{
let s:is_win = has('win32')

function! s:trim(str)
  return substitute(a:str, '[\/]\+$', '', '')
endfunction

if s:is_win
  function! s:path(path)
    return s:trim(substitute(a:path, '/', '\', 'g'))
  endfunction
else
  function! s:path(path)
    return s:trim(a:path)
  endfunction
endif

function MarkdownLevel()
  let l:h = matchstr(getline(v:lnum), '#\+')
  if empty(l:h) || len(l:h) == 1
    return '='
  else
    return '>' . (len(l:h) - 1)
  endif
endfunction

function CCTypes()
  call matchadd('Todo', '\<Hack\>')
  call matchadd('Todo', '\<Note\>')
endfunction

function ChangeCtrlPCmd()
  let currentDir = expand("%:p:h")
  let gitrepo = system('git -C ' . currentDir . ' rev-parse')
  if gitrepo =~? 'fatal'
    let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d'
  else
    let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
  endif
endfunction
" }}}
" Vim-Plug {{{
let ppath = s:path(split(&rtp, ',')[0]) . '/plugins/'
let phome = s:path(split(&rtp, ',')[0]) . '/plugged/'
call plug#begin(phome)
Plug 'equalsraf/neovim-gui-shim'                    " Gui helper by the same author
Plug 'mileszs/ack.vim'                              " Silver searcher in vim
Plug 'lervag/vimtex'                                " Latex Support
Plug 'Valloric/YouCompleteMe'                       " Autocomplete for vim
Plug 'ctrlpvim/ctrlp.vim'                           " Fuzzy Finder
Plug 'jiangmiao/auto-pairs'                         " Auto Pair Help
Plug 'vim-scripts/a.vim'                            " Quickly toggle .h to .cc
Plug 'mhinz/vim-startify'                           " Beautiful Start menu
Plug 'vimwiki/vimwiki', { 'branch': 'dev' }         " Better than org mode
Plug 'tpope/vim-fugitive'                           " Git commands
Plug 'editorconfig/editorconfig-vim'                " Config for all editors
Plug 'wesQ3/vim-windowswap'                         " Swap windows easily
Plug 'w0rp/ale'                                     " Lint engine for not c++ stuff
Plug 'tikhomirov/vim-glsl'                          " GLSL syntax
Plug 'easymotion/vim-easymotion'                    " Easy motion
Plug 'zah/nim.vim'                                  " Nim syntax
Plug 'rust-lang/rust.vim'                           " Rust Syntax
Plug 'racer-rust/vim-racer'                         " Rust Autocompletion
Plug ppath . 'lvimplug'                             " Cav Lua Example
Plug ppath . 'monokai_pro'                          " Monokai Pro Theme
call plug#end()
" }}}
" Set {{{
set hidden
set autowriteall
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set breakindent
set splitright
set splitbelow
set noswapfile
set termguicolors
set list
set modelines=1
set listchars=tab:»·,trail:·
set encoding=utf-8
set fileencoding=utf-8
scriptencoding utf-8
"set fillchars+=vert:|
set number
set relativenumber
set ignorecase
set nobackup
set nowritebackup
set expandtab
set shiftwidth=2
set tabstop=2
set showmatch
set incsearch
set hlsearch
set laststatus=2
set autoindent

set statusline=
set statusline+=%0*\ %{fugitive#statusline()}             " Git branch
set statusline+=%0*\ %t\ \|                               " File name
set statusline+=%0*\ %y\ \|                               " FileType
set statusline+=%0*\ %{''.(&fenc!=''?&fenc:&enc).''}\ \|  " Encoding
set statusline+=%0*\ %{&ff}\                              " FileFormat (dos/unix..)
set statusline+=%0*\ %=                                   " Separation
set statusline+=%0*\ row:%l/%L\ (%03p%%)\ \|              " Rownumber/total (%)
set statusline+=%0*\ col:%03c\                            " Colnr
set statusline+=%0*\ \ %m%r%w\                            " Modified? Readonly?.

set foldenable
set foldmethod=marker
set foldlevel=0
set backspace=2
set langmenu=en_US
set t_Co=256
if has('persistent_undo')
  set undolevels=5000
  set undodir=$HOME/.VIM_UNDO_FILES
  set undofile
endif
" }}}
" Let {{{
let g:racer_cmd = ""
let g:rustfmt_autosave = 0
let g:python3_host_prog='C:/Users/lmariscal/AppData/Local/Programs/Python/Python36-32/python.exe'
let g:python_host_prog='C:/Python27/python.exe'
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
let g:vimwiki_list= [{'ext': '.md',
      \ 'path': '~/notes/',
      \ 'syntax': 'markdown'}]
let g:vimwiki_folding='custom'
let g:vim_markdown_folding_disabled = 1
let g:clang_library_path='C:\\Program\ Files\\LLVM\\lib'
let g:gitgutter_enabled = 1
let g:ctrlp_map = '<c-q>'
let g:ctrlp_prompt_mappings = {
  \ 'AcceptSelection("e")': ['<space>', '<cr>', '<2-LeftMouse>'],
  \ }
let g:ctrlp_working_path_mode = 'rc'
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let $LANG = 'en_US'
set completeopt=menuone,menu,longest,preview
let g:mapleader = ' '
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](doc|tmp|inc|lib|bld|node_modules|.git|bld|CMakeFiles)',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }
let g:startify_list_order = [
\ ['   MRU'],
\ 'files',
\ ['   MRU <dir>'],
\ 'dir',
\ ['   Commands'],
\ 'commands',
\ ['   Sessions'],
\ 'sessions',
\ ['   Bookmarks'],
\ 'bookmarks',
\ ]
let g:startify_files_number = 5
let g:startify_change_to_dir = 1
let g:startify_custom_indices = map(range(1,100), 'string(v:val)')
let g:startify_custom_header = 'map(startify#fortune#boxed(), "\"   \".v:val")'
let g:indent_guides_start_level = 1
let g:indent_guides_guide_size = 1
let g:ale_sign_error = '*'
let g:ale_sign_warning = '-'
" Using [nimcheck(nim), vint(vim), markdownlint-cli(md), alex(md)]
let g:ale_linters = {
      \'nim': ['nimcheck'],
      \'vim': ['vint'],
      \'markdown': ['alex', 'markdownlint'],
      \'cpp': [],
      \'c': [],
      \'c#': [],
      \'lua': [],
      \}
let g:ycm_auto_trigger = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_error_symbol = '*'
let g:ycm_complete_in_comments = 1
let g:EditorConfig_exclude_patterns = ['fugitive://.*']
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:os=substitute(system('uname'), '\n', '', '')
if g:os ==# 'Darwin' || g:os ==# 'Mac'
  let g:ycm_show_diagnostics_ui = 0
elseif g:os ==# 'Linux'
  " Nothing
endif
let g:ale_cs_mcsc_assemblies = [
\ '/Applications/Unity/Unity.app/Contents/Managed/UnityEngine.dll',
\ '/Users/cavariux/dev/tanquesitos/obj/Debug',
\]

let g:ackprg = 'ag --vimgrep'
" }}}
" Options {{{
if s:is_win
  let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d'
else
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
endif

set background=dark
colorscheme monokai_pro

setlocal errorformat="%f",\ line\ %l:\ %
syntax on
filetype plugin on

cnoreabbrev ag Ack!

match OverLength /\%81v.\+/
fun! JumpToDef()
  if exists('*GotoDefinition_' . &filetype)
    call GotoDefinition_{&filetype}()
  else
    exe "norm! \<C-]>"
  endif
endf

" Jump to tag
" }}}
" Maps {{{
nnoremap <silent> <leader>q :CtrlP<cr>
nnoremap K kJ
nnoremap j gj
nnoremap k gk
nnoremap B ^
nnoremap E $
nnoremap <leader>f za
nnoremap <leader>a :A<cr>
nnoremap <leader>va :AV<cr>
nnoremap <leader>sa :AS<cr>
nnoremap <C-j> <C-W>j<C-W>=
nnoremap <C-k> <C-W>k<C-W>=
nnoremap <C-h> <C-W>h<C-W>=
nnoremap <C-l> <C-W>l<C-W>=
nnoremap <M-j> <C-W>j<C-W>_
nnoremap <M-k> <C-W>k<C-W>_
nnoremap <M-h> <C-W>h<C-W><Bar>
nnoremap <M-l> <C-W>l<C-W><Bar>
nnoremap <C-g> :call JumpToDef()<cr>
vnoremap K :m '<-2<CR>gv=gv
vnoremap J :m '>+1<CR>gv=gv
nmap s <Plug>(easymotion-s2)
nmap f <Plug>(easymotion-fl)
nmap F <Plug>(easymotion-Fl)
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
map  / <Plug>(easymotion-sn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
omap t <Plug>(easymotion-bd-tl)
omap f <Plug>(easymotion-bd-fl)
omap F <Plug>(easymotion-Fl)
omap / <Plug>(easymotion-tn)
  " }}}
" AutoCMD {{{
augroup aucommands
  au FileType help wincmd L
  au FileType cpp,c :call CCTypes()
  au BufEnter * :call ChangeCtrlPCmd()
  au BufEnter * match OverLength /\%81v.\+/
  au BufEnter *.ns set syntax=nim
  au BufEnter *.md setlocal foldexpr=MarkdownLevel()
  au BufEnter *.md setlocal foldmethod=expr
  au BufEnter,BufNewFile *.v,*.f,*.gl set syntax=glsl | set filetype=glsl
  au BufWritePre * :%s/\s\+$//e
  au VimEnter * iunmap <Leader>ih
  au VimEnter * iunmap <Leader>is
  au VimEnter * iunmap <Leader>ihn
  au BufWinEnter *.md set syntax=markdown | set tw=80

  au VimEnter * set visualbell t_vb=
augroup END
"}}}
