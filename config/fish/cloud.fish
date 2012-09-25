set -x EDITOR /usr/local/bin/vim
set PATH /usr/local/bin $PATH
set PATH /usr/local/sbin $PATH
set NODE_PATH /usr/local/lib/node

. functions/*.fish
. functions/z.fish

rvm reload

function migrate
  bundle exec rake db:migrate db:test:prepare
end

function be
  bundle exec $argv
end

function c
  pygmentize $argv
end

function tags
  /usr/local/bin/ctags -R --exclude=.git --exclude=log --exclude=public --exclude=tmp -f ./.tags *
end

function flush
  dscacheutil -flushcache
end

function gst
  git status
end
