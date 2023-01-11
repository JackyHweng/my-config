set fish_greeting ""

set -gx TERM xterm-256color

# theme
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

# aliases
alias c "clear"
alias ls "ls -p -G"
alias la "ls -A"
alias ll "ls -l"
alias lla "ll -A"
alias n "nvim"
alias g git
alias tmux 'tmux -2'
alias ra 'ranger'
alias vi 'nvim'
alias vim 'nvim'
alias c 'clear'
alias l 'ls -l'
alias top 'htop'
alias tnew 'tmux new -s'
alias twnew 'tmux new-window -n'
alias tkill 'tmux kill-session -t'
alias ta 'tmux a -t'
alias tls 'tmux ls'
alias rm 'trash'
alias tar 'gnutar'
alias ws 'webstorm'

command -qv nvim && alias vim nvim

set -gx EDITOR nvim

set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH

# tar gtar
set -g  TARPATH /usr/local/opt/gnu-tar/libexec/gnubin 
set -gx PATH TARPATH $PATH

# Maven
set -g MAVEN_HOME /Users/jacky/tools/maven
set -gx PATH $MAVEN_HOME/bin $PATH

# NodeJS
set -gx PATH node_modules/.bin $PATH

# Go
set -g GOPATH /usr/local/go
# set -g GOPATH /Users/jacky/goland_workspace
set -g GOBIN $GOPATH/bin
set -gx PATH $GOPATH/bin $PATH


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
