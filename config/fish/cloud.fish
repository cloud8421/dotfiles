set -x EDITOR /usr/local/bin/vim
set PATH /usr/local/bin $PATH
set PATH /usr/local/sbin $PATH
set PATH /usr/local/share/npm/bin $PATH
set NODE_PATH /usr/local/lib/node

. functions/*.fish

rvm reload > /dev/null
autojump   > /dev/null

function rehash
  . ~/.config/fish/config.fish
end

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

function gc
  git commit
end

function cleanlogs
  find . -name '*.log' | xargs rm
end

function tower
  gittower -s
end
