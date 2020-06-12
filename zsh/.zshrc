#https://wiki.archlinux.org/index.php/Dzen
HISTFILE=~/.config/zsh/histfile
HISTSIZE=80000
SAVEHIST=40000

export DISCORD_TOKEN="Njk0NTUxNzA4MTI2NDEyODgw.XoNSSA.8T6SV4XkszhgahH5BD_liL7MLV0"
export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH="$HOME/.config/zsh/om-zsh"
CASE_SENSITIVE="true"
HYPHEN_INSENSITIVE="true"
DISABLE_AUTO_UPDATE="true"
ENABLE_CORRECTION="true"
HIST_STAMPS="mm/dd/yyyy"
export MANPATH="/usr/local/man:$MANPATH"
export LANG=en_US.UTF-8

autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
zstyle ':vcs_info:git:*' formats '%F{160}(%b)'
zstyle ':vcs_info:*' enable git

plugins=(
	git
    git-flow
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
alias gclean='sudo make clean && rm -f config.h && git reset --hard 785fd5b4788c56599d7cf5a1a87f78e3fdf3fe9e'

# tabtab source for electron-forge package
# uninstall by removing these lines or running `tabtab uninstall electron-forge`
[[ -f /home/user/.cache/yay/httptoolkit/src/httptoolkit/node_modules/tabtab/.completions/electron-forge.zsh ]] && . /home/user/.cache/yay/httptoolkit/src/httptoolkit/node_modules/tabtab/.completions/electron-forge.zsh

