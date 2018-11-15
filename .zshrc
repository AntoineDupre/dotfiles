export HOME=/home/antdup
export ZSH=/home/antdup/.oh-my-zsh
export EDITOR=nvr
# ZSH_THEME="agnoster-custom"
ZSH_THEME="agnoster"


# Autojump
#
[[ -s /home/antdup/.autojump/etc/profile.d/autojump.sh ]] && source /home/antdup/.autojump/etc/profile.d/autojump.sh

autoload -U compinit && compinit -u

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=(git knife_ssh)
plugins=(git knife_ssh vundle python jsontools history git-extras gitignore sudo autojump)
# User configuration

# export PATH="/usr/lib/python2.6/site-packages/maxwidgets/input:/bin:/usr/bin:/mxn/home/antdup/bin:/usr/local/sbin:/usr/sbin:/sbin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
#



# zplug stuff
zstyle ':prezto:module:terminal' auto-title 'yes'

source "$HOME/.zplug/init.zsh"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "plugins/colored-man-pages", from:oh-my-zsh
zplug "nojhan/liquidprompt"
zplug "chrissicool/zsh-256color"
zplug "zsh-users/zsh-completions", use:src
zplug "modules/terminal", from:prezto
zplug load



# General configuration
autoload -U compinit && compinit
autoload -U promptinit && promptinit

setopt autocd               # cd without writing cd
setopt extended_glob        # extended glob syntax
setopt nomatch              # print error if pattern matches nothing
setopt notify               # report status of background jobs immediately
setopt nohashdirs           # disable hashing of dirs so we dont have to run
                            # rehash after installing new binaries (performance hit?)


# History
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=$HISTSIZE
setopt inc_append_history   # write to history immediately
setopt hist_ignore_dups     # ignore second instance of same event
setopt share_history        # share history between session
setopt extended_history     # special history format with timestamp
setopt no_hist_beep         # fucking beep
setopt hist_ignore_space    # ignore entries with leading space



####################################### Test Zone

# Completion

setopt complete_in_word     # complete from both ends of a word
setopt always_to_end        # move cursor to the end of a completed word
setopt path_dirs            # perform path search even on command names with slashes
setopt auto_menu            # show completion menu on a succesive tab press
setopt auto_list            # automatically list choices on ambiguous completion
setopt auto_param_slash     # if completed parameter is a directory, add a trailing slash
unsetopt menu_complete      # do not autoselect the first completion entry
unsetopt flow_control       # disable start/stop characters in shell editor

## Group matches and describe.
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:corrections' format ' %F{green}-- %d (errors: %e) --%f'
zstyle ':completion:*:descriptions' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle ':completion:*' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' verbose yes

## Fuzzy match mistyped completions.
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

## Directories
eval $(dircolors <(awk '/^TERM/ && !x {print "TERM xterm-termite"; x=1} 1' <(dircolors -p)))
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:*:cd:*' tag-order local-directories directory-stack path-directories
zstyle ':completion:*:*:cd:*:directory-stack' menu yes select
zstyle ':completion:*:-tilde-:*' group-order 'named-directories' 'path-directories' 'users' 'expand'
zstyle ':completion:*' squeeze-slashes true

## History
zstyle ':completion:*:history-words' stop yes
zstyle ':completion:*:history-words' remove-all-dups yes
zstyle ':completion:*:history-words' list false
zstyle ':completion:*:history-words' menu yes

# Correction

setopt correct              # spelling correction for commands
#setopt correctall           # spelling correction for arguments

#######################################





# export WORKON_HOME=~/virt_env
# # source .local/bin/virtualenvwrapper.sh
# # source ~/.local/bin/virtualenvwrapper.sh
# source /usr/share/virtualenvwrapper/virtualenvwrapper.sh

function spaw_tmux() {
	tmux attach || tmux new
}
# export PATH="/home/antdup/miniconda3/bin:$PATH"

# Liquidprompt
export LP_HOSTNAME_ALWAYS=0

# Only load liquidprompt in interactive shells, not from a script or from scp
# echo $- | grep -q i 2>/dev/null && . /usr/share/liquidprompt/liquidprompt


# Only load liquidprompt in interactive shells, not from a script or from scp
echo $- | grep -q i 2>/dev/null && . /home/antdup/.zplug/repos/nojhan/liquidprompt/liquidprompt

# Remove caps locks
setxkbmap -option caps:escape

# No screen saver
xset dpms 0

# Funzy
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Aliases
alias exa="exa-linux-x86_64"
alias ls='ls -F --color=auto'
alias ll='ls -lhF --color=auto'
alias la='ls -lhaF --color=auto'
alias e='exa'
alias ee='exa -lg --git-ignore'
alias mconda="source ~/miniconda3/bin/activate"
alias lconda="ee ~/miniconda3/envs/"
alias sconda="mconda; source activate "
alias vimt="nvr  --remote-tab"
alias vi="nvim"
alias skål="docker"
alias nvimdiff="nvim -d"
alias nv=nvr -c "cd `pwd`"
alias meteo="curl wttr.in"
export GOPATH=~/go
export VPNUSER="1G5tnyM6FQdaO_7domJuNtr0"
