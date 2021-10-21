" init autocmd
autocmd!
set encoding=utf-8
set nocompatible
set hidden
set wrap 
set title
set noerrorbells
set autoindent
set fileencodings=utf-8
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu rnu
set nowrap
set smartcase
set noswapfile
set incsearch
set hlsearch
set showcmd
set cmdheight=2
set updatetime=300
set laststatus=2
set scrolloff=10
set shortmess+=c
set signcolumn=yes
set nowritebackup
set noundofile
set nobackup
set cursorline
set termguicolors
set colorcolumn=80

" Always show tabs
set showtabline=2

set noshowmode
set updatetime=100

scriptencoding utf-8

syntax enable

let mapleader = " "


call plug#begin()
Plug 'morhetz/gruvbox'
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-eunuch'
Plug 'vim-utils/vim-man'
Plug 'lyuts/vim-rtags'
Plug 'mbbill/undotree'
Plug 'preservim/nerdtree'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/promptline.vim'
Plug 'junegunn/fzf', {'do': { -> fzf#install()}}
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdcommenter'
Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mattn/emmet-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-syntastic/syntastic'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'SirVer/ultisnips'
Plug 'artanikin/vim-synthwave84'
Plug 'Badacadabra/vim-archery'
Plug 'honza/vim-snippets' 
Plug 'junegunn/goyo.vim' 
if has('nvim') || has('patch-8.0.902')
  Plug 'mhinz/vim-signify'
else
  Plug 'mhinz/vim-signify', { 'branch': 'legacy' }
endif
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'
Plug 'joshdick/onedark.vim'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'
call plug#end()

nnoremap <Tab> gT
nnoremap <S-Tab> gt

autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear


let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-l>"

let g:signify_sign_add               = '+'
let g:signify_sign_delete            = '_'
let g:signify_sign_delete_first_line = '‾'
let g:signify_sign_change            = '~'

let g:signify_sign_show_count = 0
let g:signify_sign_show_text = 1




if (has("autocmd") && !has("gui_running"))
    augroup colorset 
        autocmd! 
        let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16": "7" }
        autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white })
    augroup END
endif

colorscheme onedark 


nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

""nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <leader>ps :Rg<SPACE>
nnoremap <silent> <leader>jl :vertical resize +3<CR>
nnoremap <silent> <leader>jh  :vertical resize -3<CR>
nnoremap <silent> <leader>jj  :resize +3<CR>
nnoremap <silent> <leader>jk  :resize -3<CR>
nnoremap <silent> <Leader>gd :YcmCompleter GoTO<CR>
nnoremap <silent> <Leader>gf :YcmCompleter FixIt<CR>


map <leader>tt :term<CR>


inoremap jk <ESC> 
inoremap kj <ESC


" Eliminating ex mode as it is irritating
nnoremap Q q:


" copy to clipboard
map <C-a>            :%y+<CR>


" some write/exit command
command! W :w
command! Wq :wq
command! Wqall :wqall


"Git status
nmap <leader>gs :Git<CR>

autocmd BufRead *.c, *.h, *.cpp, *.cc setlocal cindent

" vim hardcodes background color erase even if the terminfo file does
" not contain bce (not to mention that libvte based terminals
" incorrectly contain bce in their terminfo files). This causes
" incorrect background rendering when using a color theme with a
" background color.

let &t_ut=''
let g:user_emmet_leader_key = ','

autocmd FileType scss setl iskeyword+=@-@
autocmd BufNewFile *.sh 0r!bash ~/Templates/bash_templates.sh
