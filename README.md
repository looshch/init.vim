# init.vim for Front-end Development
Uses [vim-plug](https://github.com/junegunn/vim-plug)

## Dependencies
[Yarn](https://yarnpkg.com/), [ripgrep](https://github.com/BurntSushi/ripgrep)

## Installation
Install dependencies \
\
Open Neovim, wait for `Done in [time in seconds]` message, then run `:CocInstall` \
\
It’s ok to observe some errors/warnings, just make sure you’ve completed execution of all the commands above. May
require several Neovim restarts

## Plugins
[NERDTree](https://github.com/preservim/nerdtree) — file browser \
[fzf](https://github.com/junegunn/fzf) & [fzf.vim](https://github.com/junegunn/fzf.vim) — file search \
[Coc.nvim](https://github.com/neoclide/coc.nvim) — language server \
[splitjoin](https://github.com/AndrewRadev/splitjoin.vim) — swicth between single- and multi-line statement forms \
[vim-surround](https://github.com/tpope/vim-surround) — change surroundings \
[indentLine](https://github.com/Yggdroot/indentLine) — indentation markers

## Insert Mode
jk &nbsp; enter normal mode

## Normal Mode
\<C-h/j/k/l\> &nbsp; navigate between windows \
\<Space\>=/- &nbsp; resize window \
\<Space\>\[1–9] &nbsp; navigate between tabs \
\
// &nbsp; search history \
? &nbsp; clear search query \
\<C-s\> &nbsp; save all files in tabs \
\<Space\>a &nbsp; code action menu \
\<Space\>d &nbsp; go to definition \
\<Space\>r &nbsp; rename symbol \
\<Space\>j &nbsp; joined statement form \
\<Space\>jj &nbsp; split statement form \
cs[surrounding 1][surrounding 2] &nbsp; change surrounding 1 to surrounding 2 \
ds[surrounding] &nbsp; delete surrounding \
ys[text object][surrounding] &nbsp; add surrounding \
\
\<Space\>b &nbsp; open file browser \
&nbsp;&nbsp; o/t/s &nbsp; open file/in new tab/in vertical split view \
&nbsp;&nbsp; m &nbsp; open context menu \
\<Space\>bb &nbsp; open current file in file browser \
\<Space\>s/ss &nbsp; file content/file search \
&nbsp;&nbsp; \<C-h/j/k/l\> &nbsp; navigate between search result \
&nbsp;&nbsp; Enter &nbsp; open file \
&nbsp;&nbsp; \<C-t/v\> &nbsp; open file in new tab/in vertical split view

## Visual Mode
S[surrounding] &nbsp; add surrounding

## Commands
W &nbsp; save file with sudo

## Abbreviations
lll &nbsp; console.log(

## [Vim cheat sheet with mappings and commands](https://docs.google.com/document/d/11iPRUc-0upxiVbDZnDmMhZxuTiiyPahBsCCReZBA2JQ)
