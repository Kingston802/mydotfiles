# sets vim as manpager
export MANPAGER="/bin/sh -c \"col -b | nvim -c 'set ft=man ts=8 nomod nolist noma' -\""

PATH="$HOME/.gem/ruby/2.7.0/bin/:$PATH"
PATH="$HOME/programming/cloned-repos/vasm/:$PATH"
# export PATH=”$HOME/.emacs.d/bin:$PATH”

# Path to your oh-my-zsh installation.
export ZSH="/home/ab/.oh-my-zsh"

ZSH_THEME="robbyrussell"

# Edit line in vim with ctrl-e
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line 

plugins=(git virtualenv)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
export EDITOR='nvim'

### ARCHIVE EXTRACTION
# usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;      
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

### ALIASES 

# editor bindings
alias v="nvim"
# enable if not using both vim and nvim
# alias vim="nvim"

# navigation
alias ..='cd ..' 
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

# replacing ls with exa
alias ls='exa -al --color=always --group-directories-first' # my preferred listing
alias la='exa -a --color=always --group-directories-first'  # all files and dirs
alias ll='exa -l --color=always --group-directories-first'  # long format
alias lt='exa -aT --color=always --group-directories-first' # tree listing
alias l.='exa -a | egrep "^\."'

# don't be an idiot and confirm overwrites 
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

# development tools 
alias projucer="/usr/local/JUCE/Projucer"
alias c="compiler"
alias matlab="matlab -nodisplay" 

# the command alias to start the browser-sync server
alias serve="browser-sync start --server --files . --no-notify --host $SERVER_IP --port 9000"

alias rr='curl -s -L https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash'

# spotify command 
spt() {
  nohup python3 ~/.local/bin/trackchange.py &
  ncspot
}
