# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

################################# OH MY ZSH ###########################
export ZSH="/home/adam/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

# setting PATH
export PATH=$PATH:$HOME/.local/bin:$HOME/.yarn/bin:$HOME/bin:/usr/local/bin
export LD_LIBRARY_PATH=/usr/local/lib/

# Case-sensitive completion.
CASE_SENSITIVE="true"

plugins=(
	git
	archlinux
	dirhistory
	docker
	history
	pip
	python
	sudo
	systemd
	tmux
	zsh-syntax-highlighting
	aws
)

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# custom aliases and enhancements are loaded by oh-my-zsh from ~/.oh-my-zsh/custom

export EDITOR=vim
export VISUAL=vim

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source $HOME/.zsh_profile
