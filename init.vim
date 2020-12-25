" auto-load vim-plug on vim start
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" plugins; Yarn, ripgrep are required
call plug#begin('~/.nvim/plugged')
  " file browser
  Plug 'preservim/nerdtree'
  " file search back end
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  " file search
  Plug 'junegunn/fzf.vim'
  " language server
  Plug 'neoclide/coc.nvim'
  " switch between single- and multi-line statement forms
  Plug 'AndrewRadev/splitjoin.vim'
  " change surroundings
  Plug 'tpope/vim-surround'
  " indentation markers
  Plug 'Yggdroot/indentLine'
call plug#end()

" disable syntax highlighting
syntax off
" show line number
set number
" show line number relative to current one
set relativenumber
" each tab stops after even number of chars
set tabstop=2
" tab indents by 2 spaces
set softtabstop=2
" use spaces instead of tabs
set expandtab
" take into consideration file extension
set smartindent
" indentation for indenting tools
set shiftwidth=2
" round indentation to the nearest multiple of shiftwidth
set shiftround
" underline cursor line
set cursorline
" keep current column if there is no symbol on it
set virtualedit=all
" highlight matching brackets when cursor is over them
set showmatch
" use % to jump between angle brackets
set matchpairs+=<:>
" don’t wrap lines
set nowrap
" ignore case while searching
set ignorecase
" stop ignoring case while search query includes capitals
set smartcase
" open new windows on right
set splitright
" open new windows below
set splitbelow
" set system clipboard as default register
set clipboard+=unnamedplus
" time to wait till mapping completion
set timeoutlen=150
" preferred number of lines before horizontal edges while scrolling
set scrolloff=7
" display opened file, working directory, column number, and branch
set statusline=\ %F%m%r%h\ %w\ Column:\ %c
" time before all plugins ruled by this setting take actions after typing
set updatetime=50

" auto-trim whitespaces
au BufWritePre * %s/\s\+$//e
" put cursor on last known position on open
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" ‘W’ command saves file with sudo
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

" ‘lll’ and space produce console.log( )
iabbrev lll console.log(

let mapleader=" "

imap jk <Esc>
" navigate between windows
nmap <C-h> <C-W>h
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-l> <C-W>l
" navigate between tabs
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
" save all files in tabs
nnoremap <silent> <C-s> :wa<CR>
" search history
nnoremap // q/
" clear search
nnoremap <silent> ? :let @/=""<CR>
" resize windows
nnoremap <silent> <leader>= :vertical resize +15<CR>
nnoremap <silent> <leader>- :vertical resize -15<CR>

" NERDTree
" quit vim if window on left is NERDTree
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeWinSize=70
" remove top text
let NERDTreeMinimalUI=1
" show hidden files
let NERDTreeShowHidden=1
" show relative line number
let NERDTreeShowLineNumbers=1
" prevent ‘^G’ next to nodes
let g:NERDTreeNodeDelimiter="\u00a0"
" toggle NERDTree
nmap <silent> <leader>b :NERDTreeToggle<CR>
" sync current tab with NERDTree
nnoremap <silent> <leader>bb :NERDTreeFind<CR>

" fzf-vim
" file content search
nnoremap <leader>s :Rg<CR>
" file search
nnoremap <leader>ss :GFiles<CR>

" CoC
let g:coc_global_extensions=[ 'coc-pairs',
                            \ 'coc-emmet',
                            \ 'coc-html',
                            \ 'coc-css',
                            \ 'coc-tsserver',
                            \ 'coc-json',
                            \ 'coc-angular' ]
nmap <silent> <leader>a <Plug>(coc-codeaction)
nmap <silent> <leader>d :call CocAction('jumpDefinition', 'tab drop')<CR>
nmap <leader>r <Plug>(coc-rename)

" splitjoin
let g:splitjoin_split_mapping='<leader>jj'
let g:splitjoin_join_mapping='<leader>j'

" indentLine
let g:indentLine_char='⎸'
