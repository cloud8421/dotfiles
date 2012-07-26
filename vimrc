" loading pathogen at runtime as it's bundled
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

set nocompatible  " Use Vim settings, rather then Vi settings
set nobackup
set nowritebackup
set notimeout
set ttimeout
set ttimeoutlen=10
set noswapfile                    " It's 2012, Vim."
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set t_Co=256
syntax on

filetype plugin indent on

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set expandtab

" Display extra whitespace
set list listchars=tab:»·,trail:·
" Clipboard fix for OsX
set clipboard=unnamed

" Numbers
set number
set numberwidth=5

"Folding
set foldmethod=indent
set foldlevelstart=99

" Autocompletion options
set wildmode=list:longest,list:full
set complete=.,w,b

" Tags
let Tlist_Ctags_Cmd = "/usr/local/bin/ctags -R --exclude=.git --exclude=log --exclude='*.js' -f ./.tags *"
set tags+=.tags

source $HOME/.vim/autocommands.vim
source $HOME/.vim/plugins.vim
source $HOME/.vim/shortcuts.vim
source $HOME/.vim/syntax.vim
source $HOME/.vim/tmux.vim
source $HOME/.vim/visual_fixes.vim
source $HOME/.vim/spell_fixes.vim
source $HOME/.vim/rails.vim
