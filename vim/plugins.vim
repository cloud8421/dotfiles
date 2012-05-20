"Ctrlp configuration
let g:ctrlp_working_path_mode = 2
set wildignore+=*/.hg/*,*/.svn/*,*/vendor/cache/*,*/public/system/*,*/tmp/*,*/log/*
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'

" NERDTree customization
let NERDTreeShowHidden=0
let NERDTreeShowBookmarks=0
let g:NERDTreeChDirMode=2
nmap <silent> <leader>3 :NERDTreeToggle<cr>
