export TERM=xterm-256color

# 入力補完用
autoload -U compinit
compinit

# for vim
bindkey -v

# ディレクトリ名を入れただけでcd
setopt auto_cd

# cd - のあとタブキーで移動履歴を見れる
setopt auto_pushd

# 入力補完時に大文字小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# タイポ修正
setopt correct

# Path to your oh-my-zsh installation.
export ZSH=/Users/HF/.oh-my-zsh

export PYTHONPATH=${PYTHONPATH}:/Users/HF/Library/pynaoqi
export DYLD_LIBRARY_PATH=${DYLD_LIBRARY_PATH}:/Users/HF/Library/pynaoqi

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell" #"terminalparty"

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
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git ruby osx bundler brew rails emoji-clock)

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:$HOME/.local/bin:$HOME/Library/Python/2.7/bin"
export PATH=/usr/local/share/python:$PATH
export PYTHONPATH=${PYTHONPATH}:~/pynaoqi-python2.7-2.1.4.13-mac64
#export MANPATH="/usr/local/man:$MANPATH"

export GOOGLE_APPLICATION_CREDENTIALS=/Users/HF/Documents/python/SR_demo_for_NAO-a0b7adc79fe9.json

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

if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

alias vi='vim'

alias where="command -v"
alias j="jobs -l"

alias ls="ls -G -w"
alias la="ls -a"
alias lf="ls -F"
alias ll="ls -l"
alias llt="ls -lt"
alias lt="ls -t"
alias lla="ls -la"
alias l="ls"

alias du="du -h"
alias df="df -h"

alias su="su -l"

export PATH=/usr/local/Cellar:$PATH

export LC_ALL='ja_JP.UTF-8'

# 補完候補一覧をカラー表示
export LSCOLORS=ExFxCxdxBxegedabagacad
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
zstyle ':completion:*' list-colors 'di=;34;1' 'ln=;35;1' 'so=;32;1' 'ex=31;1' 'bd=46;34' 'cd=43;34'

# zplug -------------------
source ~/.zplug/zplug

zplug "wbinglee/zsh-wakatime"

# syntax
zplug "chrissicool/zsh-256color"
zplug "Tarrasch/zsh-colors"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "ascii-soup/zsh-url-highlighter"

# program
zplug "voronkovich/mysql.plugin.zsh"

# tools
zplug "marzocchi/zsh-notify"
zplug "oknowton/zsh-dwim"

zplug "mafredri/zsh-async"
zplug "sindresorhus/pure"

# プラグインを読み込み、コマンドにパスを通す
zplug load --verbose

# end zplug ---------------

# tmux --------------------
if [ -z "$PS1" ]; then return ; fi

if [ -z $TMUX ] ; then
        if [ -z `tmux ls` ] ; then
                tmux
        else
                tmux attach
        fi
fi
# end tmux ----------------

# The next line updates PATH for the Google Cloud SDK.
source '/Users/HF/Downloads/google-cloud-sdk/path.zsh.inc'

# The next line enables shell command completion for gcloud.
source '/Users/HF/Downloads/google-cloud-sdk/completion.zsh.inc'

# peco
function peco-select-history() {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi
    BUFFER=$(\history -n 1 | \
        eval $tac | \
        peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history
# end peco
