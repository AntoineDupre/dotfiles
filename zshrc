# ------------------------------------------
# Setup environment
export HOME=/home/antdup
export ZSH=/home/antdup/.oh-my-zsh
export EDITOR=nvim
#export EDITOR=nvre

# ------------------------------------------
# Autojump
#
[[ -s /home/antdup/.autojump/etc/profile.d/autojump.sh ]] && source /home/antdup/.autojump/etc/profile.d/autojump.sh

autoload -U compinit && compinit -u

# ------------------------------------------
# Oh my zsh configuration
ZSH_THEME="amuse"

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
plugins=(fzf git knife_ssh vundle python jsontools history git-extras gitignore sudo autojump)
# User configuration


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


# ------------------------------------------
# zplug stuff
zstyle ':prezto:module:terminal' auto-title 'yes'

source "$HOME/.zplug/init.zsh"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "plugins/colored-man-pages", from:oh-my-zsh
# zplug "nojhan/liquidprompt"
zplug "chrissicool/zsh-256color"
zplug "zsh-users/zsh-completions", use:src
zplug "modules/terminal", from:prezto
zplug "fdw/ranger_autojump"
zplug load
##


# ------------------------------------------
# General configuration
autoload -U compinit && compinit
autoload -U promptinit && promptinit

setopt autocd               # cd without writing cd
setopt extended_glob        # extended glob syntax
setopt nomatch              # print error if pattern matches nothing
setopt notify               # report status of background jobs immediately
setopt nohashdirs           # disable hashing of dirs so we dont have to run
                            # rehash after installing new binaries (performance hit?)


# ------------------------------------------
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

# ------------------------------------------
# Completion
setopt complete_in_word     # complete from both ends of a word
setopt always_to_end        # move cursor to the end of a completed word
setopt path_dirs            # perform path search even on command names with slashes
setopt auto_menu            # show completion menu on a succesive tab press
setopt auto_list            # automatically list choices on ambiguous completion
setopt auto_param_slash     # if completed parameter is a directory, add a trailing slash
unsetopt menu_complete      # do not autoselect the first completion entry
unsetopt flow_control       # disable start/stop characters in shell editor

# ------------------------------------------
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

# ------------------------------------------
## Fuzzy match mistyped completions.
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

# ------------------------------------------
## Directories
# eval $(dircolors <(awk '/^TERM/ && !x {print "TERM xterm-termite"; x=1} 1' <(dircolors -p)))
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:*:cd:*' tag-order local-directories directory-stack path-directories
zstyle ':completion:*:*:cd:*:directory-stack' menu yes select
zstyle ':completion:*:-tilde-:*' group-order 'named-directories' 'path-directories' 'users' 'expand'
zstyle ':completion:*' squeeze-slashes true

# ------------------------------------------
## History
zstyle ':completion:*:history-words' stop yes
zstyle ':completion:*:history-words' remove-all-dups yes
zstyle ':completion:*:history-words' list false
zstyle ':completion:*:history-words' menu yes


# Conda
zstyle ':completion::complete:*' use-cache 1
fpath+=$HOME/conda-zsh-completion
compinit conda

# ------------------------------------------
# Correction
setopt correct              # spelling correction for commands
#setopt correctall           # spelling correction for arguments


# ------------------------------------------
# Virtual env
export WORKON_HOME=~/virt_env
# source .local/bin/virtualenvwrapper.sh
# source ~/.local/bin/virtualenvwrapper.sh
source /usr/bin/virtualenvwrapper.sh

# !-! spawn_tmux - Start a new tmux session or attach the latest one
function spawn_tmux() {
	tmux attach || tmux new
}
# export PATH="/home/antdup/miniconda3/bin:$PATH"

# ------------------------------------------
# Liquidprompt
export LP_HOSTNAME_ALWAYS=0

# # Only load liquidprompt in interactive shells, not from a script or from scp
# echo $- | grep -q i 2>/dev/null && . $HOME/.zplug/repos/nojhan/liquidprompt/liquidprompt
#
#
# # Only load liquidprompt in interactive shells, not from a script or from scp
# echo $- | grep -q i 2>/dev/null && . $HOME/.zplug/repos/nojhan/liquidprompt/liquidprompt

# ------------------------------------------
# Remove caps locks
setxkbmap -option caps:escape
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# ------------------------------------------
# Aliases
alias _ls='/bin/ls -F --color=auto'
alias _ll='/bin/ls -lhF --color=auto'
alias ll='lsd -la'
alias ls='lsd -1a'
alias la='ls -lhaF --olor=auto'
# alias e='exa'
alias ee='exa -lg --git-ignore'
alias et='exa -Tlg --git-ignore'
alias mconda="source ~/miniconda3/bin/activate"
alias lconda="ee ~/miniconda3/envs/"
alias sconda="mconda; source activate "
alias vimt="nvr  --remote-tab"
alias vi="nvim"
# alias e="nvr"
# why not !
alias skål="docker"
alias nvimdiff="nvim -d"
 alias nv=nvr -c "cd `pwd`"
alias fe="~/.cargo/bin/fe"
alias meteo="curl wttr.in"
# Setup go path
export GOPATH=~/go
export PATH=$PATH:$GOPATH/bin
# add cargo bin
export PATH=$PATH:/home/antdup/.cargo/bin
alias kitty="/home/antdup/.local/kitty.app/bin/kitty"
alias c="clear"
alias mv="mv -v"
alias cp="cp -v"
alias one_screen="xrandr --output DP-2-3  --off --output DP-2-1 --off --output eDP-1 --off"
alias dm="~/projects/others/dm/dm.sh"
alias sw="~/projects/others/dm/dm.sh sw"
alias fm="~/projects/others/dm/dm.sh fm"
alias psk="~/projects/others/dm/dm.sh ps"
alias op="~/projects/others/dm/dm.sh op"
alias rn="~/projects/others/dm/dm.sh rn"
alias o="xdg-open"

function e() {
   nvr -cc "cd `pwd`" -c "NERDTreeVCS" $1
   # nvr -c "NERDTree `pwd`"
}

# Powerline fonts
powerline-daemon -q
. /usr/lib/python3.7/site-packages/powerline/bindings/zsh/powerline.zsh


# prompt toolkits envs
alias pt_ptpython='workon ptpython;ptpython;deactivate'
alias pt_mycli='workon mycli'
alias pt_litecli='workon litecli'
alias pt_wharfee='workon wharfee;wharfee;deactivate'
alias pt_xonsh='workon xonsh;xonsh;deactivate'
alias pt_gitsome='workon gitsome;gitsome;deactivate'
alias pt_http='workon http-prompt;http-prompt;deactivate'
alias nordvästersjökustartilleriflygspaningssimulatoranläggningsmaterielunderhållsuppföljningssystemdiskussionsinläggsförberedelsearbeten='ls'
function dus(){
du -sh * |  sort -h
}
#
# zstyle -e ':completion:*:(ssh|scp|sftp|rsh|rsync):hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'
alias green="ssh w-v-ssh-green-0 -XY"
alias blue="ssh w-v-ssh-blue-0 -XY"


# Fzf
#
# !-! fh - History: repeat history
fh() {
  print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed -r 's/ *[0-9]*\*? *//' | sed -r 's/\\/\\\\/g')
}

# !-! da - Docker: start
function da() {
  local cid
  cid=$(docker ps -a | sed 1d | fzf -1 -q "$1" | awk '{print $1}')

  [ -n "$cid" ] && docker start "$cid" && docker attach "$cid"
}

# !-! dpull - Docker: pull from maxiv
function dpull() {
  local cid
  cid=$(python /home/antdup/scripts/docker_list.py | fzf -1 -q "$1" | awk '{print $1}')

  [ -n "$cid" ] && docker pull  docker.maxiv.lu.se/"$cid"
}

# !-! drun - Docker: run from maxiv
function drun() {
  local cid
  cid=$(python /home/antdup/scripts/docker_list.py | fzf -1 -q "$1" | awk '{print $1}')

  [ -n "$cid" ] && docker run -it  docker.maxiv.lu.se/"$cid"
}

# Process
# !-! fkill - Kill processes
fkill() {
    local pid
    if [ "$UID" != "0" ]; then
        pid=$(ps -f -u $UID | sed 1d | fzf -m | awk '{print $2}')
    else
        pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')
    fi

    if [ "x$pid" != "x" ]
    then
        echo $pid | xargs kill -${1:-9}
    fi
}



# Git
# !-! fbr - Git: checkout git branch (including remote branches)
fbr() {
  local branches branch
  branches=$(git branch --all | grep -v HEAD) &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

# !-! fcoc - Git: checkout git commit
fcoc() {
  local commits commit
  commits=$(git log --pretty=oneline --abbrev-commit --reverse) &&
  commit=$(echo "$commits" | fzf --tac +s +m -e) &&
  git checkout $(echo "$commit" | sed "s/ .*//")
}

# !-! fshow - Git commit browser
fshow() {
  git log --graph --color=always \
      --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
  fzf --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort \
      --bind "ctrl-m:execute:
                (grep -o '[a-f0-9]\{7\}' | head -1 |
                xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
                {}
FZF-EOF"
}

is_in_git_repo() {
  git rev-parse HEAD > /dev/null 2>&1
}


# !-! fgst - Git pick files from `git status -s`
fgst() {
  # "Nothing to see here, move along"
  is_in_git_repo || return

  local cmd="${FZF_CTRL_T_COMMAND:-"command git status -s"}"

  eval "$cmd" | FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} --reverse $FZF_DEFAULT_OPTS $FZF_CTRL_T_OPTS" fzf -m "$@" | while read -r item; do
    echo "$item" | awk '{print $2}'
  done
  echo
}


# Tmux fzf
#
# !-! tm - Tmux: start
tm() {
  [[ -n "$TMUX" ]] && change="switch-client" || change="attach-session"
  if [ $1 ]; then
    tmux $change -t "$1" 2>/dev/null || (tmux new-session -d -s $1 && tmux $change -t "$1"); return
  fi
  session=$(tmux list-sessions -F "#{session_name}" 2>/dev/null | fzf --exit-0) &&  tmux $change -t "$session" || echo "No sessions found."
}

# !-! fs - Tmux; list sessions
fs() {
  local session
  session=$(tmux list-sessions -F "#{session_name}" | \
    fzf --query="$1" --select-1 --exit-0) &&
  tmux switch-client -t "$session"
}

# ftpane - Tmux: switch pane
ftpane() {
  local panes current_window current_pane target target_window target_pane
  panes=$(tmux list-panes -s -F '#I:#P - #{pane_current_path} #{pane_current_command}')
  current_pane=$(tmux display-message -p '#I:#P')
  current_window=$(tmux display-message -p '#I')

  target=$(echo "$panes" | grep -v "$current_pane" | fzf +m --reverse) || return

  target_window=$(echo $target | awk 'BEGIN{FS=":|-"} {print$1}')
  target_pane=$(echo $target | awk 'BEGIN{FS=":|-"} {print$2}' | cut -c 1)

  if [[ $current_window -eq $target_window ]]; then
    tmux select-pane -t ${target_window}.${target_pane}
  else
    tmux select-pane -t ${target_window}.${target_pane} &&
    tmux select-window -t $target_window
  fi
}

# !-! j - Jump: autojump
j() {
    if [[ "$#" -ne 0 ]]; then
        cd $(autojump $@)
        return
    fi
    cd "$(autojump -s | sort -k1gr | awk '$1 ~ /[0-9]:/ && $2 ~ /^\// { for (i=2; i<=NF; i++) { print $(i) } }' |  fzf --height 40% --reverse --inline-info)"
    }

# In tmux.conf
# bind-key 0 run "tmux split-window -l 12 'bash -ci ftpane'"

# cd history
#  from https://github.com/changyuheng/zsh-interactive-cd
#
source $HOME/zsh-interactive-cd.plugin.zsh

# List all the custum fuction
function x() {
    python /home/antdup/scripts/list_command.py | fzf | python /home/antdup/scripts/split_command.py | xdotool type --clearmodifiers --file -
}
