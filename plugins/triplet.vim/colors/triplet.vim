" Name: Triplet
" Author: Leonardo Mariscal
" License: MIT

hi clear
if exists('syntax_on')
    syntax reset
endif

let g:colors_name = 'triplet'

set background=dark

hi Normal term=NONE cterm=NONE gui=NONE guifg=#c8b794 guibg=#082627

hi ColorColumn  term=NONE cterm=NONE gui=NONE guifg=NONE guibg=#08267
hi LineNr       term=NONE cterm=NONE gui=NONE guifg=#4cb39c guibg=bg

hi Comment      term=NONE cterm=NONE gui=NONE guifg=#50bd3f guibg=NONE
hi FoldColumn   term=NONE cterm=NONE gui=NONE guifg=#50bd3f guibg=NONE
hi Folded       term=NONE cterm=NONE gui=NONE guifg=#50bd3f guibg=NONE
hi SignColumn   term=NONE cterm=NONE gui=NONE guifg=#50bd3f guibg=NON
hi SpecialKey   term=NONE cterm=NONE gui=NONE guifg=#50bd3f guibg=NONE
hi StatusLineNC term=bold cterm=NONE gui=bold guifg=NONE guibg=NONE
hi VertSplit    term=NONE cterm=NONE gui=NONE guifg=#c8b794 guibg=NONE

hi CursorColumn term=NONE cterm=NONE gui=NONE guifg=NONE guibg=#303030
hi CursorLineNr term=NONE cterm=NONE gui=NONE guifg=#4cb39c guibg=#052021
hi CursorIM     term=NONE cterm=NONE gui=NONE guifg=#082627 guibg=#93ea99
hi CursorLine   term=NONE cterm=NONE gui=NONE guifg=#082627 guibg=#93ea99
hi Cursor       term=NONE cterm=NONE gui=NONE guifg=#082627 guibg=#93ea99
hi Directory    term=NONE cterm=NONE gui=NONE guifg=#93ea99 guibg=NONE
hi ErrorMsg     term=NONE cterm=NONE gui=NONE guifg=fg guibg=#5F0000
hi Error        term=NONE cterm=NONE gui=NONE guifg=fg guibg=#5F0000
hi IncSearch    term=NONE cterm=NONE gui=NONE guifg=#082627 guibg=#93ea99
hi Search       term=NONE cterm=NONE gui=NONE guifg=#082627 guibg=#93ea99
hi MatchParen   term=NONE cterm=NONE gui=NONE guifg=#4cb39c guibg=#052021
hi ModeMsg      term=NONE cterm=NONE gui=NONE guifg=NONE guibg=NONE
hi MoreMsg      term=NONE cterm=NONE gui=NONE guifg=NONE guibg=NONE
hi Question     term=NONE cterm=NONE gui=NONE guifg=NONE guibg=NONE
hi StatusLine   term=NONE cterm=NONE gui=NONE guifg=#082627 guibg=#a89072
hi Todo         term=BOLD,UNDERLINE cterm=BOLD,UNDERLINE gui=BOLD,UNDERLINE guifg=#50bd3f guibg=#052021
hi WarningMsg   term=NONE cterm=NONE gui=BOLD guifg=#50bd3f guibg=NONE
hi WildMenu     term=NONE cterm=NONE gui=BOLD guifg=fg guibg=black
hi String       term=NONE cterm=NONE gui=NONE guifg=#4cb39c guibg=NONE
hi NonText      term=NONE cterm=NONE gui=NONE guifg=#4cb39c guibg=NONE

hi SpellBad term=BOLD cterm=BOLD ctermfg=13 ctermbg=NONE gui=UNDERLINE guifg=#c3d9ce guibg=NONE
hi SpellCap term=BOLD cterm=BOLD ctermfg=13 ctermbg=NONE gui=UNDERLINE guifg=#c3d9ce guibg=NONE
hi SpellLocal term=BOLD cterm=BOLD ctermfg=13 ctermbg=NONE gui=UNDERLINE guifg=#c3d9ce guibg=NONE
hi SpellRare term=BOLD cterm=BOLD ctermfg=13 ctermbg=NONE gui=UNDERLINE guifg=#c3d9ce guibg=NONE

hi PmenuSel   term=NONE cterm=NONE gui=NONE guifg=#082627 guibg=#98ea9e
hi PmenuSbar  term=NONE cterm=NONE gui=NONE guifg=#4cb39c guibg=#052021
hi Pmenu      term=NONE cterm=NONE gui=NONE guifg=#4cb39c guibg=#052021
hi PmenuThumb term=NONE cterm=NONE gui=NONE guifg=#4cb39c guibg=#052021
hi TabLineSel term=NONE cterm=NONE gui=NONE guifg=#4cb39c guibg=#052021

hi Visual     term=reverse cterm=reverse ctermfg=NONE ctermbg=NONE gui=NONE guifg=#082627 guibg=#90ed98
hi VisualNOS  term=reverse cterm=reverse ctermfg=NONE ctermbg=NONE gui=UNDERLINE guifg=#082627 guibg=#90ed98

hi Menu        term=NONE cterm=NONE gui=NONE guifg=NONE guibg=NONE
hi Scrollbar   term=NONE cterm=NONE gui=NONE guifg=NONE guibg=NONE
hi TabLineFill term=NONE cterm=NONE gui=NONE guifg=NONE guibg=#6C6C6C
hi TabLine     term=NONE cterm=NONE gui=NONE guifg=NONE guibg=NONE
hi Tooltip     term=NONE cterm=NONE gui=NONE guifg=NONE guibg=NONE

hi Boolean        term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi Character      term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi Conceal        term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi Conditional    term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi Constant       term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi Debug          term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi Define         term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi Delimiter      term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi Directive      term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi Exception      term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi Float          term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi Format         term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi Function       term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi Identifier     term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi Ignore         term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi Include        term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi Keyword        term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi Label          term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi Macro          term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi Number         term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi Operator       term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi PreCondit      term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi PreProc        term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi Repeat         term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi SpecialChar    term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi SpecialComment term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi Special        term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi Statement      term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi StorageClass   term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi Structure      term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi Tag            term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi Title          term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi Typedef        term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi Type           term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
hi Underlined     term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
