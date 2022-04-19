# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

################################# OH MY ZSH ###########################
export ZSH="/home/adam/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$HOME/dev/dp/scripts:$PATH:$HOME/.local/bin:$HOME/.yarn/bin/
export LD_LIBRARY_PATH=/usr/local/lib/

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

plugins=(git
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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

################################## ALIASES ################################### 
source ./aliases

############################### DOCKER DEV STUFF ##############################

alias docker-kill="docker ps --format '{{.Image}} {{.Names}}' | fzf -m --preview 'docker ps | grep {2}' | cut -d ' ' -f 2 | xargs -I '{}' -r docker kill '{}'"
alias docker-exec='docker exec -it $(docker ps --format "{{.Image}} {{.Names}}" | fzf --preview="docker ps | grep {2}"   | cut -d " " -f 2) bash'
alias docker-rmi='docker images --format "{{.Repository}} {{.Tag}} {{.ID}}" | fzf -m --preview "docker images --format \"{{.ID}} {{.CreatedAt}}\" | grep {3}" | cut -d " " -f 3 | xargs -I "{}" -r docker rmi "{}"'
alias docker-rmif='docker images --format "{{.Repository}} {{.Tag}} {{.ID}}" | fzf -m --preview "docker images --format \"{{.ID}} {{.CreatedAt}}\" | grep {3}" | cut -d " " -f 3 | xargs -I "{}" -r docker rmi "{}" --force'
alias docker-dev='docker-compose -f docker-compose-dev.yml up -d'
alias ls=lsd
alias ranger='. ranger'
alias ra='ranger'
alias gits='git status'
alias gitc='git checkout'

export EDITOR=vim
export VISUAL=vim

################################################################################
################################## SEZNAM SHIT #################################

export DEBFULLNAME="Adam Venger"
export DEBEMAIL="adam.venger@firma.seznam.cz"

alias mysql-id='mysql -usklik -hskdb-id.dev.dszn.cz sklik_id'
alias mysql-moneyi='mysql -usklik -hskdb-money.dev.dszn.cz sklik_money'
alias mysql-common='mysql -usklik -hskdb-common.dev.dszn.cz sklik_common'
alias mysql-relation='mysql -usklik -hskdb-relation.dev.dszn.cz sklik_relation'
alias mysql-journal-db='mysql -hskdb-journal-db.dev.dszn.cz -uroot -psklik sklik_journal'
alias mysql-node1='mysql -usklik -hskdb-n1.dev.dszn.cz sklik_node'
alias mysql-node2='mysql -usklik -hskdb-n2.dev.dszn.cz sklik_node'
alias mysql-node3='mysql -usklik -hskdb-n3.dev.dszn.cz sklik_node'
alias mysql-node4='mysql -usklik -hskdb-n4.dev.dszn.cz sklik_node'
alias mysql-node5='mysql -usklik -hskdb-n5.dev.dszn.cz sklik_node'
alias mysql-node6='mysql -usklik -hskdb-n6.dev.dszn.cz sklik_node'
alias mysql-node7='mysql -usklik -hskdb-n7.dev.dszn.cz sklik_node'
alias mysql-node8='mysql -usklik -hskdb-n8.dev.dszn.cz sklik_node'
alias mysql-notification='mysql -usklik -hskd-notification.dev.dszn.cz --database sklik_notification'
alias mysql-journal='mysql -hsklik-db.dev.dszn.cz -usklik --database sklik_journal'
alias mysql-report='mysql -hskdb-report.dev.dszn.cz -usklik report'
alias mysql-report-db='mysql -hskdb-report-db.dev.dszn.cz -usklik report'
alias mysql-ogar='mysql -usklik -hskdb-ogar.dev.dszn.cz sklik_ogar'
alias mysql-controlserver='mysql -usklik -hskdbcontrol.dev.dszn.cz controlserver'

############################### END SEZNAM SHIT ################################
################################################################################

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
