syntax on
filetype plugin indent on

let mapleader = ","
let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_WinWidth = 50
map <F4> :TlistToggle<cr>

set nocompatible
set ignorecase " Eg /-style searches will ignore case
set smartcase
set title " In xterm, set the name of the current file as title
set scrolloff=3 " More context around cursor
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
set hlsearch " Highlight hits
set incsearch " ...dynamically as they are typed.
set number " Show line numbers
set ruler " Show position at the bottom right corner
set visualbell " Disable audio bell
set statusline=%F%m%r%h%w\ (%Y)\ (%l/%L,%c)
set laststatus=2 " Always show the statusline on the 2nd last row
set incsearch " While typing a search, show where the pattern matches
set history=500
set pastetoggle=<F2> " The no-paste mode disables auto-indenting

highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
