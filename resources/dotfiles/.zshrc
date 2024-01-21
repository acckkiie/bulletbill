# https://qiita.com/b4b4r07/items/8cf5d1c8b3fbfcf01a5d
function chpwd() { ls }

# compinit
autoload -Uz compinit
compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion::complete:*' use-cache true
zstyle ':completion:*:default' menu select=1

# zsh-completions
fpath=(/usr/local/share/zsh-completions $fpath)

# vcs
autoload -Uz vcs_info

# colors
autoload -Uz colors
colors

# zsh setting: print_eight_bit
setopt print_eight_bit

# zsh setting: ariable reference
setopt prompt_subst

# setting prompt for git
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{red}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{blue}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u(%b)%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }

# setting prompt
PROMPT='%{$fg[yellow]%}[%n@%m]%{$reset_color%}'
PROMPT=$PROMPT'%{${fg[magenta]}%}[%D{%Y/%m/%d %H:%M:%S}]%{${reset_color}%}'
PROMPT=$PROMPT'%{${fg[cyan]}%}[%~]%{${reset_color}%}'
PROMPT=$PROMPT'${vcs_info_msg_0_}%{${reset_color}%}
'

# history
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt share_history
setopt append_history
setopt inc_append_history
setopt hist_no_store
setopt hist_reduce_blanks
function peco-history-selection() {
    BUFFER=$(\history -n -r 1 | peco --query "$LBUFFER")
    CURSOR=$BUFFER
    echo $CURSOR | pbcopy
}

# direnv
eval "$(direnv hook zsh)"

# alias
alias diff='colordiff'
alias ls='ls -G'
alias tree='tree -N'
alias history='peco-history-selection'
