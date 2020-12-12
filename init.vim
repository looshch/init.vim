" auto-load vim-plug on vim start
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" plugins; Yarn, ack are required
call plug#begin('~/.nvim/plugged')
  " file browser
  Plug 'preservim/nerdtree'
  " file search back end
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  " file search
  Plug 'junegunn/fzf.vim'
  " file content search
  Plug 'mileszs/ack.vim'
  " language server
  Plug 'neoclide/coc.nvim'
call plug#end()

" show line number
set number
" show line number relative to current one
set relativenumber
" each tab stops after every even number of chars
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
set tm=150
" prefered number of lines before horizontal edges while scrolling
set so=7
" display opened file, working directory, column number, and branch
set statusline=\ %F%m%r%h\ %w\ CWD:\ %r%{getcwd()}%h\ Column:\ %c\ %{GitBranch()}
" display tab number and file name in tab line
set tabline=%!TabLine()
" time before all plugins ruled by this setting take actions after typing
set updatetime=50
" auto-trim whitespaces
au BufWritePre * %s/\s\+$//e
" put cursor on last known position on open
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" show git branch name
function! GitBranch()
  let l:branchname = system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
  return strlen(l:branchname) > 0 ? l:branchname : ''
endfunction

" tabs with order number instead of number of windows
function! TabLine()
  let s = ''
  let wn = ''
  let t = tabpagenr()
  let i = 1
  while i <= tabpagenr('$')
    let buflist = tabpagebuflist(i)
    let winnr = tabpagewinnr(i)
    let s .= '%' . i . 'T'
    let s .= (i == t ? '%1*' : '%2*')
    let s .= ' '
    let wn = tabpagewinnr(i,'$')
    let s .= (i== t ? '%#TabNumSel#' : '%#TabNum#')
    let s .= i
    let s .= ' %*'
    let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
    let bufnr = buflist[winnr - 1]
    let file = bufname(bufnr)
    let buftype = getbufvar(bufnr, 'buftype')
    if buftype == 'nofile'
      if file =~ '\/.'
        let file = substitute(file, '.*\/\ze.', '', '')
      endif
    else
      let file = fnamemodify(file, ':p:t')
    endif
    if file == ''
      let file = '—'
    endif
    let s .= file
    let s .= (i == t ? '%m' : '')
    let i = i + 1
  endwhile
  let s .= '%T%#TabLineFill#%='
  return s
endfunction

" ‘W’ command saves file with sudo
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

" ‘lll’ and space produce console.log( )
iabbrev lll console.log(

let mapleader = " "

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
" clear search
nnoremap <silent> ? :let @/ = ""<CR>
" resize windows
nnoremap <silent> <leader>= :vertical resize +15<CR>
nnoremap <silent> <leader>- :vertical resize -15<CR>

" NERDTree
" quit vim if window on left is NERDTree
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" set default width to 70 symbols
let NERDTreeWinSize=70
" remove top text
let NERDTreeMinimalUI=1
" show hidden files
let NERDTreeShowHidden=1
" show relative line number
let NERDTreeShowLineNumbers=1
" toggle NERDTree
nmap <silent> <leader>b :NERDTreeToggle<CR>
" sync current tab with NERDTree
nnoremap <silent> <leader>bb :NERDTreeFind<CR>

" fzf-vim
" file search
nnoremap <leader>ff :GFiles<CR>

" ack
" Ack! call wrapped in function to prevent shell output
function Search(string) abort
  let saved_shellpipe = &shellpipe
  let &shellpipe = '>'
  try
    execute 'Ack! -i' shellescape(a:string, 1)
  finally
    let &shellpipe = saved_shellpipe
  endtry
endfunction
" file content search
nnoremap <leader>f :call Search("")<left><left>

" CoC
" extensions
let g:coc_global_extensions = [ 'coc-pairs',
                              \ 'coc-emmet',
                              \ 'coc-html',
                              \ 'coc-css',
                              \ 'coc-tsserver',
                              \ 'coc-json',
                              \ 'coc-angular' ]
" code action menu. If it doesn’t show up, just press J or K or increase updatetime setting
nmap <silent> <leader>a <Plug>(coc-codeaction)
" go to definition
nmap <silent> <leader>d :call CocAction('jumpDefinition', 'tab drop')<CR>
" rename symbol. To rename as globally as possible, make sure you’re at the top of 'go to definition tree'
" (<leader>d doesn’t move you nowhere)
nmap <leader>r <Plug>(coc-rename)
" confirm completion of selected item in suggestions on Enter
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif
