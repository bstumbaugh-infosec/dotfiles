" ============================================================
" Beezy's .vimrc — Dvorak-friendly
" ============================================================

" --- Escape mapping (Dvorak: hh = jj position on QWERTY) ---
inoremap hh <Esc>
vnoremap hh <Esc>

" --- General ---
set nocompatible
set encoding=utf-8
set backspace=indent,eol,start
set hidden                      " Allow switching buffers without saving
set autoread                    " Reload files changed outside vim
set history=500
set mouse=a                     " Enable mouse in all modes

" --- Display ---
syntax on
set number                      " Line numbers
set relativenumber              " Relative line numbers for easy jumping
set cursorline                  " Highlight current line
set showmatch                   " Highlight matching brackets
set scrolloff=8                 " Keep 8 lines above/below cursor
set sidescrolloff=8
set signcolumn=yes              " Always show sign column (no layout shift)
set laststatus=2                " Always show status line
set ruler                       " Show cursor position
set showcmd                     " Show partial commands
set wildmenu                    " Tab completion menu for commands
set wildmode=longest:full,full

" --- Search ---
set incsearch                   " Search as you type
set hlsearch                    " Highlight matches
set ignorecase                  " Case-insensitive search...
set smartcase                   " ...unless you use a capital letter
nnoremap <CR> :nohlsearch<CR>  " Enter clears search highlights

" --- Indentation ---
set autoindent
set smartindent
set expandtab                   " Spaces, not tabs
set tabstop=4
set shiftwidth=4
set softtabstop=4
filetype plugin indent on

" --- Splits ---
set splitbelow                  " New horizontal splits below
set splitright                  " New vertical splits to the right

" --- Performance ---
set lazyredraw                  " Don't redraw during macros
set ttyfast
set updatetime=300

" --- Undo / Backup ---
set undofile                    " Persistent undo across sessions
set undodir=~/.vim/undodir
set noswapfile
set nobackup
set nowritebackup

" --- Leader key ---
let mapleader=" "               " Space as leader

" --- Quality of life mappings ---
" Write/quit shortcuts
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>x :x<CR>

" Split navigation (Ctrl + default hjkl)
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Buffer navigation
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bp :bprev<CR>
nnoremap <leader>bd :bdelete<CR>

" Move lines up/down in visual mode
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Keep cursor centered when scrolling
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap n nzz
nnoremap N Nzz

" Yank to system clipboard
nnoremap <leader>y "+y
vnoremap <leader>y "+y

" --- Filetype-specific ---
autocmd FileType yaml setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType json setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType sh setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType markdown setlocal wrap linebreak

" --- Create undo directory if it doesn't exist ---
if !isdirectory(expand("~/.vim/undodir"))
    call mkdir(expand("~/.vim/undodir"), "p")
endif

" --- Status line ---
set statusline=
set statusline+=\ %f            " Filename
set statusline+=\ %m            " Modified flag
set statusline+=\ %r            " Read-only flag
set statusline+=%=              " Right-align the rest
set statusline+=\ %y            " Filetype
set statusline+=\ %l:%c         " Line:column
set statusline+=\ [%p%%]        " Percentage through file
