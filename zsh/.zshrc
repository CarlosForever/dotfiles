export ZSH="$HOME/.oh-my-zsh"
export PATH=$HOME/bin:/usr/local/bin:$PATH
export MANPATH="/usr/local/man:$MANPATH"
export LANG=en_US.UTF-8

CASE_SENSITIVE="true"
HYPHEN_INSENSITIVE="true"
DISABLE_AUTO_UPDATE="true"
ENABLE_CORRECTION="true"
ZSH_DISABLE_COMPFIX="true"
HIST_STAMPS="mm/dd/yyyy"


autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
zstyle ':vcs_info:git:*' formats '%F{160}(%b)'
zstyle ':vcs_info:*' enable git

plugins=(
    git
    bundler
    dotenv
    zsh-autosuggestions
    zsh-syntax-highlighting
    last-working-dir
    web-search
    extract
    history
    sudo
    z
)

source $ZSH/oh-my-zsh.sh
autoload -U colors &&
PROMPT='[%F{160}%?%f]%F{125}%n%f@%F{201}%m%f[%F{196}%1~%f]%f %F{46}%#%f '

#aliases
alias c='clear'
alias l='ls -l --color=auto'
alias gclean='make clean ; rm -f config.h ; git reset --hard 052f1802ffa81556cab3c07fd6fccadd955157ba'

