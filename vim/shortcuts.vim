" Enables mouse detection
set mouse=a

"Change leader key
let mapleader="§"

" NERDTree
map <leader>3 :NERDTreeToggle<CR>

" Rails.vim Backbone shortcuts
map <leader>jm :Rjmodel
map <leader>jv :Rjview
map <leader>jr :Rjrouter

" Tagbar
nmap <F8> :TagbarToggle<CR>

" Fixes pasting
noremap <leader>y "*y
noremap <leader>p :set paste<CR>"*p<CR>:set nopaste<CR>
noremap <leader>P :set paste<CR>"*P<CR>:set nopaste<CR>"

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Faster shortcut for commenting. Requires T-Comment plugin
map <leader>c <c-_><c-_>

"Saves time; maps the spacebar to colon
nmap <space> :

"Bubble single lines (kicks butt)
"http://vimcasts.org/episodes/bubbling-text/
nmap <C-Up> ddkP
nmap <C-Down> ddp
nmap <C-Left> <<
nmap <C-Right> >>

"Horizontal bubbling
vnoremap < <gv
vnoremap > >gv
nmap gV `[v`]

"Bubble multiple lines
vmap <C-Up> xkP`[V`]
vmap <C-Down> xp`[V`]
vmap <C-Right> >gv
vmap <C-Left> <gv

"Tabularize
vmap <silent> <leader>a :Tabularize /\|<CR>

"Surround
map <leader>s ysiw

"Automplete with §
imap § <C-n>

"Ctrlp shortcuts
nmap <silent> <leader>1 :CtrlP<cr>
nmap <silent> <Leader>2 :CtrlPTag<cr>

"tab navigation
nmap <silent> <Left> :tabprevious<cr>
nmap <silent> <Right> :tabnext<cr>

"swap panes layout
nmap <F9> <C-w>t<C-w>H
nmap <F10> <C-w>t<C-w>K

"enable . in visual mode
vnoremap . :norm.<CR>

"Fixes end of line movement in visual mode
vmap $ g_

"Underscores to camelcase and viceversa
map <leader>k :s#_\(\l\)#\u\1#g<cr>
map <leader>u :s#\(\<\u\l\+\|\l\+\)\(\u\)#\l\1_\l\2#g<cr>
