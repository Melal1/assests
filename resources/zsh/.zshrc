
# Aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias makedwm='cd $HOME/suckless/dwm && rm -f config.h && sudo make clean install'
alias ll='ls -alh --color=auto'
alias v="nvim"


# Environment Variables
export ZVM_KEYTIMEOUT=20
export ZVM_VI_ESCAPE_BINDKEY='jk'
export PATH="$HOME/.local/bin:$PATH"

# History Settings
HISTSIZE=5000
HISTFILE=~/.config/zsh/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# FZF Configuration
export FZF_DEFAULT_COMMAND="find . -path '*/.git/*' -prune -o -printf '%P\n'"

# Custom Fuzzy Completion
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

_fzf_complete_v() {
  _fzf_complete --multi --reverse --header-lines=3 -- "$@" < <(
    ls -al
  )
}

zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup

# Zsh Completion Settings
_comp_options+=(globdots)
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no

# Key Bindings
bindkey '^f' autosuggest-accept
bindkey '^ ' autosuggest-execute

# Initialization
eval "$(zoxide init --cmd cd zsh)"
eval "$(fzf --zsh)"
eval "$(oh-my-posh init zsh --config '~/.config/zsh/prompt/promptconf.toml')"
# Plugins
source $ZDOTDIR/plugins/sudo.plugin.zsh
source $ZDOTDIR/plugins/git-aliases.zsh
source $ZDOTDIR/plugins/zsh-you-should-use/you-should-use.plugin.zsh
fpath=(~/.config/zsh/plugins/zsh-completions/src $fpath)
autoload -Uz compinit && compinit
source $ZDOTDIR/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh
source $ZDOTDIR/plugins/zsh-autopair/autopair.zsh
source $ZDOTDIR/plugins/fzf-tab/fzf-tab.zsh
source $ZDOTDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

