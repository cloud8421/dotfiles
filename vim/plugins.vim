"Ctrlp configuration
let g:ctrlp_working_path_mode = 2
set wildignore+=*/.hg/*,*/.svn/*,*/vendor/cache/*,*/public/system/*,*/tmp/*,*/log/*
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$|\.jhw-cache$'

" NERDTree customization
let NERDTreeShowHidden=0
let NERDTreeShowBookmarks=0
let g:NERDTreeChDirMode=2
nmap <silent> <leader>3 :NERDTreeToggle<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PROMOTE VARIABLE TO RSPEC LET
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! PromoteToLet()
  :normal! dd
  " :exec '?^\s*it\>'
  :normal! P
  :.s/\(\w\+\) = \(.*\)$/let(:\1) { \2 }/
  :normal ==
endfunction
:command! PromoteToLet :call PromoteToLet()
:map <leader>l :PromoteToLet<cr>
