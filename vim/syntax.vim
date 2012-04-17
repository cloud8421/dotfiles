" Fixes syntax highlight for Ruby files
au BufRead,BufNewFile {Capfile,Gemfile,Rakefile,Thorfile,Vagrantfile,config.ru,.caprc,.irbrc,irb_tempfile*} set ft=ruby

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Zencoding
let g:user_zen_expandabbr_key = '<c-e>'
let g:use_zen_complete_tag = 1
