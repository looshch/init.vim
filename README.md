# .vimrc for Front-end Development
Uses [vim-plug](https://github.com/junegunn/vim-plug). vim-X11 is recommended for system clipboard support

## Dependencies
[Yarn](https://yarnpkg.com/), [ack](https://beyondgrep.com/)

## Installation
Wait for `Done in [time in seconds]` message, then run `:CocInstall` \
\
It’s ok to observe some errors/warnings, just make sure you’ve completed execution of all the commands above. May
require several Vim restarts

## Plugins
[gruvbox](https://github.com/morhetz/gruvbox) — color scheme \
[EditorConfig](https://github.com/editorconfig/editorconfig-vim) — editor config support \
[vim-move](https://github.com/matze/vim-move) — move selected text \
[NERD Commenter](https://github.com/preservim/nerdcommenter) — comment lines out \
[NERDTree](https://github.com/preservim/nerdtree) — file browser \
[fzf](https://github.com/junegunn/fzf) & [fzf.vim](https://github.com/junegunn/fzf.vim) — file search \
[ack.vim](https://github.com/mileszs/ack.vim) — file content search \
[Coc.nvim](https://github.com/neoclide/coc.nvim) — language server

## Normal Mode
### jk &nbsp; enter normal mode
\<C-h/j/k/l\> &nbsp; navigate between windows \
\<Space\>=/- &nbsp; resize window \
\<Space\>\[1–9] &nbsp; navigate between tabs \
\
\<C-/\> &nbsp; clear search query \
\<C-s\> &nbsp; save all files in tabs \
\<Alt-h/j/k/l\> &nbsp; move selected text \
\<Space\>c &nbsp; toggle line commenting \
\<Space\>a &nbsp; code action menu \
\<Space\>d &nbsp; go to definition \
\<Space\>r &nbsp; rename symbol \
\
\<Space\>n &nbsp; open file browser \
&nbsp;&nbsp; o/t/s &nbsp; open file/in new tab/in vertical split view \
&nbsp;&nbsp; m &nbsp; open context menu \
\<Space\>s &nbsp; open current file in file browser \
\<Space\>f &nbsp; file content search \
&nbsp;&nbsp; o/t/v &nbsp; open file/in new tab/in vertical split view \
\<Space\>ff &nbsp; file search \
&nbsp;&nbsp; \<C-h/j/k/l\> &nbsp; navigate between search result \
&nbsp;&nbsp; Enter &nbsp; open file \
&nbsp;&nbsp; \<C-t/v\> &nbsp; open file in new tab/in vertical split view

## Commands
W &nbsp; save file with sudo

## Abbreviations
lll &nbsp; console.log(

## [Vim cheat sheet with mappings and commands](https://docs.google.com/document/d/11iPRUc-0upxiVbDZnDmMhZxuTiiyPahBsCCReZBA2JQ)
