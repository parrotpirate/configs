# If you come from bash you might have to change your $PATH.
export PATH="$HOME/bin:/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="$PATH:$HOME/.composer/vendor/bin"
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"
export PATH="$PATH:$HOME/.composer/vendor/bin"
export PATH="/Users/stevep/Library/Python/3.7/bin:$PATH"
# export PATH="/usr/local/opt/valet-php@7.2/bin:$PATH"
# export PATH="/usr/local/opt/valet-php@7.2/sbin:$PATH"
export TERM="xterm-256color"
export DISPLAY=:0.0
fpath=(~/.zsh/completions $fpath)
autoload -U compinit && compinit

# Path to your oh-my-zsh installation.
export ZSH="/Users/stevep/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# GITHUB CLI VARIABLES
export GH_TOKEN='08386368e55dea63684d0c2ec455efd2ef7062d9'

# Customise the Powerlevel9k prompts
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=' '
# POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX=$'\uE0B1 '
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%F{014}\u2570%F{cyan}\uF460%F{073}\uF460%F{109}\uF460%f "
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(vi_mode context ssh dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator ram load background_jobs)
POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=$'\uE0C6'
POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR=$'\uE0C4'
POWERLEVEL9K_LEFT_SEGMENT_END_SEPARATOR=''
POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=$'\uE0C7'
POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR=$'\uE0C5'
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
DEFAULT_USER='stevep'
POWERLEVEL9K_VI_MODE_NORMAL_BACKGROUND='160'
POWERLEVEL9K_VI_MODE_NORMAL_FOREGROUND='148'
POWERLEVEL9K_VI_MODE_INSERT_BACKGROUND='090'
POWERLEVEL9K_VI_MODE_INSERT_FOREGROUND='040'
VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true
POWERLEVEL9K_VI_INSERT_MODE_STRING='INSERT'
POWERLEVEL9K_VI_COMMAND_MODE_STRING='COMMAND'
P9K_VI_MODE_VISUAL_STRING='VISUAL'
P9K_VI_MODE_SEARCH_STRING='SEARCH'

# Load Nerd Fonts with Powerlevel9k theme for Zsh
POWERLEVEL9K_MODE='nerdfont-complete'

source  ~/powerlevel9k/powerlevel9k.zsh-theme


# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
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

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=cyan,bg=#872787,underline"

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

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  auto-color-ls
  autojump
  autoupdate
  brew
  command-not-found
  compleat
  composer
  copyfile
  docker
  git-auto-fetch
  git-extras
  git-flow
  git-prune
  hacker-quotes
  npm
  osx
  rsync
  sudo
  symfony-console
  # taskwarrior
  # timewarrior
  vi-mode
  vscode
  wp-cli
  yarn
  zsh_reload
  zsh-apple-touchbar
  zsh-autopair
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

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
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias ls="colorls --group-directories-first"
alias lsa="colorls -a --group-directories-first"

# Edit host file
alias edithost="sudo nvim /etc/hosts"

# Source Reload
alias reload.zsh="source ~/.zshrc"
alias reload.profile="source ~/.bash_profile"
alias reload.term="source ~/.bash_profile && source ~/.zshrc"

# Copy the PWD to the Clipboard
alias cpwd="pwd | tr -d '\n' | pbcopy && echo 'pwd copied to clipboard'"

#rsync with progress bar
alias rsyncp="rsync -a --info=progress2"

#Kill background jobs
alias kbj="kill %"

#MacVim
alias vim="/usr/local/Cellar/macvim/8.1-157/MacVim.app/Contents/MacOS/Vim"

#GIT ALIASES
#Git branch
alias gb="git branch"
#Git branch delete
alias gbd="git branch -D"
#Git remote branch delete
alias gbdr="git push origin --delete"
#Git branch delete all merged remote branches
alias gbdmr="git branch -r --merged | egrep -v \"(^\*|master|dev)\" | sed 's/origin\///' | xargs -n 1 git push origin --delete"
# Git branch delete all merged local branches
alias gbdml="git branch --merged | egrep -v \"(^\*|master|dev)\" | xargs git branch -d"
# Git branch delete all merged branches local and remote
alias gbdma="git branch --merged | egrep -v \"(^\*|master|dev)\" | xargs git branch -d && git branch -r --merged | egrep -v \"(^\*|master|dev)\" | sed 's/origin\///' | xargs -n 1 git push origin --delete"
#List repo branchs
alias gbl="git branch -l --column"
#List remote branches
alias gblr="git branch -lr --column"
#Git add
alias ga="git add"
#Git add all
alias gaa="git add --all"
#Interactive Git Add
alias gai="git add --interactive"
#Git commit
alias gc="git commit"
#Git Commit Message
alias gcm="git commit -m"
#Git Commit Amend
alias gca="git commit --amend"
#Git Checkout
alias gco="git checkout"
#Git create and checkout branch
alias gcb="git checkout -b"
#Git Clone
alias gcl="git clone"
#Git fetch all prune
alias gfa="git fetch --all --prune"
#Git flow push after release
alias gfp="git push origin develop master --follow-tags"
#Git flow update master and develop branches
alias gfs="git checkout --quiet --detach HEAD && \
            git fetch origin master:master develop:develop ; \
            git checkout --quiet -"
#Git pull
alias gl="git pull"
#Git push
alias gp="git push"
#Git force push
alias gpf="git push --force"
#Git push everything
alias gpoat='git push origin --all && git push origin --tags'
#Git pull origin
function ggl() {
  if [[ "$#" != 0 ]] && [[ "$#" != 1 ]]; then
    git pull origin "${*}"
  else
    [[ "$#" == 0 ]] && local b="$(git_current_branch)"
    git pull origin "${b:=$1}"
  fi
}
compdef _git ggl=git-checkout
#Git push origin
function ggp() {
  if [[ "$#" != 0 ]] && [[ "$#" != 1 ]]; then
    git push origin "${*}"
  else
    [[ "$#" == 0 ]] && local b="$(git_current_branch)"
    git push origin "${b:=$1}"
  fi
}
compdef _git ggp=git-checkout
#Git sync origin
function ggpp() {
  if [[ "$#" == 0 ]]; then
    ggl && ggp
  else
    ggl "${*}" && ggp "${*}"
  fi
}
compdef _git ggpnp=git-checkout
#Git Force Push Origin
function ggpf() {
    [[ "$#" == 0 ]] && local b="$(git_current_branch)"
    git push --set-upstream --force origin "${b:=$1}"
}
compdef _git ggfp=git-checkout

#Git Rebase Point
function grp() {
	parent_branch=$(git show-branch | sed "s/].*//" | grep "\*" | grep -v "$(git rev-parse --abbrev-ref HEAD)" | head -n1 | sed "s/^.*\[//")
	git rev-parse $parent_branch | pbcopy
}
compdef _git grp=git-checkout

#Git Rebase Interactive Auto Point
function gria() {
	parent_branch=$(git show-branch | sed "s/].*//" | grep "\*" | grep -v "$(git rev-parse --abbrev-ref HEAD)" | head -n1 | sed "s/^.*\[//")
	rebase_sha=$(git rev-parse $parent_branch)
	git rebase -i $rebase_sha
}
compdef _git gria=git-checkout

#Git Publish
function ggpublish() {
  #if [[ "$#" != 0 ]] && [[ "$#" != 1 ]]; then
  #  git push origin "${*}"
  #else
    [[ "$#" == 0 ]] && local b="$(git_current_branch)"
    git push -u origin "${b:=$1}"
  #fi
}
compdef _git ggpublish=git-checkout

#Git reset
alias grh='git reset --hard && git clean -f -d'
#Git status
alias gst='git status'

#Hit target file/folder with low orbit ion cannon
alias nuke="rm -rf"

#QMK folder
alias qmk="cd /Users/stevep/qmk_firmware"
alias makedox="make ergodox_ez:mk-2:teensy"
alias makegamepad="make ergodox_ez:gamepad:teensy"

#Sites folder
alias sites="cd ~/Sites"

#Scratchpad
alias cpad="code /Users/stevep/Documents/scratchpad.md"
alias npad="nvim /Users/stevep/Documents/scratchpad.md"
alias pad="nvim -c 'set filetype=markdown'"

#taskopen alias
alias to="taskopen"
alias tk="task"
alias tkl="task list"

#bugwarrior-pull alias
alias bp="bugwarrior-pull && task list ids"

#Timewarrior Report
alias twr="timew daily_totals :day"

#Firenvim update
alias firenvimupdate="cd ~/firenvim && git reset --hard && git pull && npm install && npm run build && npm run install_manifests && cd ~"

#Homebrew update
alias brewu="brew update; brew upgrade"

#Tridactyl Config
alias tridactylconfig="nvim ~/configs/tridactyl/tridactylrc"
alias vb4cconfig="nvim ~/.config/vb4c/.cvimrc"

#ZSH Config
alias zshconfig="nvim /Users/stevep/.zshrc"
alias vimconfig="nvim ~/.vimrc"
alias vimplugconfig="nvim ~/.vimpluglist"
alias nvimconfig="nvim ~/.config/nvim/init.vim"
alias vimsnippets="cd ~/.config/nvim/mysnippets/"
alias vimupdate="nvim -c 'PlugUpgrade | PlugUpdate'"

#Commitizen
alias commit="npx @stanlindsey/git-cz"

#Q4VR Dev Startup
alias vrdevstart="composer update && npm install && npm run watch"

#Reset terminal window
alias reset="~ && clear"

#Git Flow Setup
alias gfinit="git flow init -d"
alias gfconfig="git config gitflow.path.hooks ~/git-flow-hooks && git config gitflow.hotfix.finish.message \"Hotfix %tag%\" && git config gitflow.release.finish.message \"Release %tag%\""

#Remove all Docker Images
alias drma="docker system prune -af"
alias dcp="docker container prune -f"
alias dip="docker image prune -af"
alias dockerclean="docker container prune -f && docker image prune -af"

# Wordrpess database export
alias wpdbe="wp db export"

# Valet database list
alias vdbl="valet db list"

# Site launch script
alias q4sl="~/q4sl.sh"
alias createdockerconfig="~/createdockerconfig.sh"

# Docker aliases
alias dc="docker-compose"
alias dce="docker-compose exec"
alias dcepb="docker-compose exec php bash"
alias dcu="docker-compose up -d"
alias dcd="docker-compose down -v"
alias dcs="docker-compose stop"
alias dwp="docker-compose run --rm wpcli"
alias dockernuke="docker system prune --volumes -f"
alias q4localsetup="~/q4localsetup.sh"
alias q4localdev="gh repo clone PropertyBrands/q4-local-dev && cd q4-local-dev"

# Optimize images
alias optimizeimages="imageoptim ./*"
alias imageoptimize="imageoptim ./*"
alias optimg="imageoptim ./*"
alias imgopt="imageoptim ./*"

#FUCK
eval "$(thefuck --alias)"

#Zip files with progress
function zipp {
  # zip -qr -X - $1 | pv -bep -s $(gdu -bs $1 | awk '{print $1}') > $2
  zip -r -X $1 $2 2>&1 |
  pv -lep -s $(ls -Rl1 $2 | egrep -c '^[-/]') > /dev/null
}

#Unzip with progress
function unzipp {
  n_files = !unzip -l $2 | grep .png | wc -l
!unzip -o $2 -d $1 | pv -l -s {n_files[0]} > /dev/null
}

#Zip files with Keka7z
function keka {
  /Applications/Keka.app/Contents/Resources/keka7z a "$1".zip "$2" -r
}

# Add VS Code command line tool
function vsc {
    if [[ $# = 0 ]]
    then
        open -a "Visual Studio Code"
    else
        local argPath="$1"
        [[ $1 = /* ]] && argPath="$1" || argPath="$PWD/${1#./}"
        open -a "Visual Studio Code" "$argPath"
    fi
}

# Wordpress find replace
function wpsr {
  wp search-replace "$1" "$2" --skip-columns=guid --skip-tables=wp_users
}

# Valet drop database
function vdbd {
  clipboard="$(pbpaste)"
  valet db drop -y "$(pbpaste)"
}

function tks {
  if [ -z "$1" ]
  then
    task +ACTIVE stop
  else
    task +ACTIVE stop
    taskopen "$1" && task start "$1" && osascript -e 'tell application "iTerm"
	activate
	try
		tell current window
			toggle hotkey window
		end tell
	end try
end tell'
  fi
}

#Open with CodeKit
function codekit {
	if  [ -z "$1" ]
	then
		open "$PWD" -a codekit.app
	else
		open $1 -a codekit.app
	fi
}

#Copy Path
function cpath {
    if [[ $# = 0 ]]
    then
        pwd | tr -d '\n' | pbcopy && echo "$argPath copied to clipboard"
    else
        local argPath="$1"
        [[ $1 = /* ]] && argPath="$1" || argPath="$PWD/${1#./}"
        echo "$argPath" | tr -d '\n' | pbcopy && echo "$argPath copied to clipboard"
    fi
}

# Create directory and cd into it
function mkcd {
  if [ ! -n "$1" ]; then
    echo "Enter a directory name"
  elif [ -d $1 ]; then
    echo "\`$1' already exists"
  else
    mkdir $1 && cd $1
  fi
}

# Update all the things
function uatt {
  echo 'Updating Homebrew' && brew update
  echo 'Updating Homebrew packages' && brew upgrade
  echo 'Cleaning up Homebrew' && brew cleanup
  echo 'Updating Composer packages' && composer global update
  echo 'Updating global Node packages' && npm --global update
  echo 'Updating NeoVim plugins' && nvim +PlugUpgrade +PlugUpdate +qa!
  echo '\n'
  echo 'Updates complete!'
}

function localdockersetup {
  ~/createdockerconfig.sh
  docker-compose up -d
  rm -rf $PWD/wp-content/plugins/really-simple-ssl
  open http://0.0.0.0:8000
}

function dwpsr {
  if [ "$1" = "in" ]; then
    docker-compose run --rm wpcli search-replace "$2" "http://0.0.0.0:8000" --skip-columns=guid --skip-tables=wp_users
  elif [ "$1" = "out" ]; then
    docker-compose run --rm wpcli search-replace "http://0.0.0.0:8000" "$2" --skip-columns=guid --skip-tables=wp_users
  fi
}

# "jj" to enter vi cmd mode
bindkey "jj" vi-cmd-mode

# Set Python Environment
if command -v pyenv 1>/dev/null 2>&1; then
 eval "$(pyenv init -)"
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
