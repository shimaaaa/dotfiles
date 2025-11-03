# Alias ====================================
alias ll='ls -lah'

# History ====================================
HISTFILE=$HOME/.zsh-history
HISTSIZE=100000
SAVEHIST=1000000
setopt inc_append_history
setopt share_history
autoload colors

# Zinit ====================================
### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
zinit light chrissicool/zsh-256color

# skim
function skim-hist() {
	BUFFER=$(history -n -r 1 | sk --query "$LBUFFER" --reverse)
	CURSOR=$#BUFFER
	zle reset-prompt
}
zle -N skim-hist
bindkey '^r' skim-hist

function skim-src() {
	local selected_dir=$(ghq list -p | sk --query "$LBUFFER" --reverse)
	BUFFER="cd ${selected_dir}"
	zle accept-line
}
zle -N skim-src
bindkey '^]' skim-src

# Pyenv ====================================
eval "$(pyenv init -)"

# nodebrew =================================
export PATH=$HOME/.nodebrew/current/bin:$PATH

# poetry
export PATH=/Users/shima/.local/bin:$PATH

# kubectl
autoload -Uz compinit
compinit
source <(kubectl completion zsh)

# starship
eval "$(starship init zsh)"


# starship
eval "$(starship init zsh)"
# starship
eval "$(starship init zsh)"
