set fish_greeting ""

set -gx TERM xterm-256color

# theme
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

# aliases
alias ls "ls -p -G"
alias la "ls -A"
alias ll "ls -l"
alias lla "ll -A"
alias g git
alias ra='ranger'
alias v='nvim'
alias vi='nvim'
alias vim='nvim'
alias c='clear'
alias l='ls -l'
alias tnew='tmux new -s'
alias twnew='tmux new-window -n'
alias tkill='tmux kill-session -t'
alias twkill='tmux kill-window -t'
alias ta='tmux a -t'
alias twls='tmux list-windows'
alias tls='tmux ls'
alias rm='trash'

ulimit -c unlimited

# http proxy
#set -g https_proxy=http://127.0.0.1:10080;
#set -g http_proxy=http://127.0.0.1:10080;
#set -g all_proxy=socks5://127.0.0.1:10080;



command -qv nvim && alias vim nvim

set -gx EDITOR nvim

set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH

# NodeJS
set -gx PATH node_modules/.bin $PATH

# Go
set -g GOPATH $HOME/go
set -gx PATH $GOPATH/bin $PATH


# Shell
set -g MYSHELL_HOME /Users/jacky/shell
set -gx PATH $MYSHELL_HOME $PATH

# NVM
function __check_rvm --on-variable PWD --description 'Do nvm stuff'
  status --is-command-substitution; and return

  if test -f .nvmrc; and test -r .nvmrc;
    nvm use
  else
  end
end

switch (uname)
  case Darwin
    source (dirname (status --current-filename))/config-osx.fish
  case Linux
    source (dirname (status --current-filename))/config-linux.fish
  case '*'
    source (dirname (status --current-filename))/config-windows.fish
end

set LOCAL_CONFIG (dirname (status --current-filename))/config-local.fish
if test -f $LOCAL_CONFIG
  source $LOCAL_CONFIG
end
