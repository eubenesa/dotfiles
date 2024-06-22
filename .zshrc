zstyle ':omz:alpha:lib:git' async-prompt no
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="bullet-train"
BULLETTRAIN_STATUS_EXIT_SHOW=true
BULLETTRAIN_TIME_12HR=true
BULLETTRAIN_GIT_COLORIZE_DIRTY=true

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
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

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
  battery
  bazel
  brew
  colored-man-pages
  colorize
  command-not-found
  copybuffer
  copyfile
  copypath
  cp
  dircycle
  dirhistory
  dirpersist
  dotenv
  emoji-clock
  emoji
  emotty
  encode64
  fancy-ctrl-z
  frontend-search
  git-auto-fetch
  git
  github
  gitignore
  history-substring-search
  history
  isodate
  jira
  jsontools
  keychain
  last-working-dir
  lighthouse
  macos
  man
  node
  npm
  nvm
  per-directory-history
  ssh-agent
  sublime
  sudo
  systemd
  timer
  urltools
  vscode
  web-search
  yarn
  zsh-interactive-cd
  zsh-navigation-tools
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
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="code ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias c="clear"
alias ls="ls -alGh"
alias grbim="grbi master"
alias moon="curl wttr.in/moon"
alias npmcc="npm cache clean"
# alias npmOg="npmO -g"
alias npmrei="rm -rf node_modules npm-debug.log && npmcc --force && npm i"
alias q="exit"
alias reyarn="ycc && rm -rf node_modules yarn-error.log && y"
alias update="cd && weather && omz update && bubu && brew outdated --cask && nvm ls-remote | grep 'Latest LTS\|v22.' && npmO -g"
alias weather="curl wttr.in/\?m"

# alias d2d="cd /Users/esa/cargurus/cg-main/cargurus-site-static/packages/cargurus-dealer-2-dealer"
# alias dd-web="cd /Users/esa/cargurus/cg-main/cargurus-site-static/packages/dealer-dashboard-web"
alias smc="cd /Users/esa/cargurus/cg-main/cargurus-site-static/packages/cargurus-wholesale-smc"
alias wos="cd /Users/esa/cargurus/cg-main/cargurus-site-static/packages/cargurus-wholesale-offer-service"

export PATH="/usr/local/opt/curl/bin:$PATH"
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/cargurus/cg-main/cargurus-build/local/devbox-push:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi

source /usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# List of accounts to read the last tweet from, comma separated
# The first in the list is read by the party parrot.
export TTC_BOTS="tinycarebot,selfcare_bot,magicrealismbot"

# Use this to have a different animal say a message in the big box.
export TTC_SAY_BOX="parrot"

# List of folders to look into for `git` commits, comma separated.
export TTC_REPOS="~/code"

# The max directory-depth to look for git repositories in
# the directories defined with `TTC_REPOS`. Note that the deeper
# the directory depth, the slower the results will be fetched.
export TTC_REPOS_DEPTH=2

# Location/zip code to check the weather for. Both 90210 and "San Francisco, CA"
# _should_ be ok (the zip code doesn't always work -- use a location
# first, if you can). It's using weather.service.msn.com behind the curtains.
export TTC_WEATHER="Boston, MA"

# Set to false if you're an imperial lover <3
export TTC_CELSIUS=true

# Unset this if you _don't_ want to use Twitter keys and want to
# use web scraping instead.
export TTC_APIKEYS=true

# Refresh the dashboard every 20 minutes.
export TTC_UPDATE_INTERVAL=20

# Turn off terminal title
export TTC_TERMINAL_TITLE=false

# Twitter api keys
export TTC_CONSUMER_KEY=""
export TTC_CONSUMER_SECRET=""
export TTC_ACCESS_TOKEN=""
export TTC_ACCESS_TOKEN_SECRET=""

# Note: in tiny-terminal-care < 1.0.7, the recommended variables for the Twitter
# API keys were the ones before. As of 1.0.8, they are deprecated
# (because the names are too generic), but will still be supported
# until the next major version.
# export CONSUMER_KEY='...'
# export CONSUMER_SECRET='...'
# export ACCESS_TOKEN='...'
# export ACCESS_TOKEN_SECRET='...'

# Default pomodoro is 20 minutes and default break is 5 minutes.
# You can change these defaults like this.
export TTC_POMODORO=20
export TTC_BREAK=5
