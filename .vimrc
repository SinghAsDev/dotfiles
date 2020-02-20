set nonu
set nocompatible
set autoindent
set smartindent
set history=50
set showcmd
set tabstop=4
set shiftwidth=4
set expandtab
set showmatch
set guioptions-=T
set ruler
set hls
set incsearch
set virtualedit=all
set statusline=%F%m%r%h%w\ [Format=%{&ff}]\ [Type=%Y]\ [ASCII=\%03.3b]\ [Pos=%04l,%04v][%p%%]\ [Len=%L]
set laststatus=2
set number 
set nocp

execute pathogen#infect()
syntax on
filetype plugin indent on

map <F2> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
map <F4> : ctags -R
nmap <Tab> >>
map <S-Tab> <C-d>

" TagList options
let Tlist_Close_On_Select = 1 "close taglist window once we selected something
let Tlist_Exit_OnlyWindow = 1 "if taglist window is the only window left,  exit vim
let Tlist_Show_Menu = 1 "show Tags menu in gvim
let Tlist_Show_One_File = 1 "show tags of only one file
let Tlist_GainFocus_On_ToggleOpen = 1 "automatically switch to taglist  window
let Tlist_Highlight_Tag_On_BufEnter = 1 "highlight current tag in taglist  window
let Tlist_Use_Right_Window = 1 "display taglist window on the right
let Tlist_Display_Prototype = 1 "display full prototype instead of just function name
let Tlist_Ctags_Cmd ="/usr/bin/ctags"

nnoremap <F5> :TlistToggle
nnoremap <F6> :TlistShowPrototype

set t_Co=256
set background=dark
colorscheme monokai

" Start NERDTree if vim is opened with no file
autocmd vimenter * if !argc() | NERDTree | endif
