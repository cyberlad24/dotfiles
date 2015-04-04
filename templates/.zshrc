ZSH="$HOME/.dotfiles/.oh-my-zsh"
EDITOR="vim"
ZSH_THEME="blinks"
plugins=(bower brew git git-extras grunt history-substring-search jsontools mvn node npm osx tmuxinator web-search z zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh
unsetopt correct_all
unsetopt correct

if [[ -f "$HOME/.aliases" ]]; then
    source $HOME/.aliases
fi

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

TERM=xterm-256color
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="mm/dd/yyyy"

bindkey -s '\el' 'ls -la\n'                 # [Esc-l] - run command: ls

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

if [[ "$OSTYPE" == "linux-gnu" ]]; then
    export PATH="$HOME/.linuxbrew/bin:$PATH"
    export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
    export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"
fi
