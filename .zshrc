# Path to your oh-my-zsh installation.
export ZSH=/Users/esa/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="ys"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

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
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder


export RBENV_ROOT=/usr/local/var/rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

fpath=(/usr/local/share/zsh-completions $fpath)


# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(bower brew bundler colored-man colorize copydir copyfile cp dirhistory ember-cli gem git github grunt history last-working-dir node npm osx postgres pow powify rails rake rbenv ruby ssh-agent sublime sudo xcode zsh-syntax-highlighting)

# User configuration

# export PATH="/usr/local/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
# export PATH="$PATH:./bin"
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
export SSH_KEY_PATH="~/.ssh/id_rsa"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="subl ~/.zshrc"
alias zshsource="source ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias blog="cd ~/code/eubenesa.github.io"
alias bowerreset="rm -rf bower_components && bower cache clean && bower install"
alias c="clear"
alias code="cd ~/code"
alias edp="ember divshot push"
alias gf="git fetch --all -p -v"
alias hhr="cd ~/code/happyhourradio"
alias ls="ls -alGh"
alias nbd="cd ~/code/nbdlabel"
alias npmreset="rm -rf node_modules && npm cache clean && npm install"
alias q="exit"
alias skyrkt="cd ~/code/skyrocket"

function mkdircd {
  mkdir -p "$@" && cd "$_";
}

function updateembercli {
  npm uninstall -g ember-cli
  npm cache clean
  bower cache clean
  npm install -g ember-cli@latest
  rm -rf node_modules bower_components dist tmp
  npm install --save-dev ember-cli@latest
  npm install
  bower install
  ember init
}

function fixpow {
  brew uninstall pow
  brew install pow
  sudo pow --install-system
  pow --install-local
  lunchy stop pow
  lunchy start pow
}

function update {
  upgrade_oh_my_zsh
  bubu
  gem update --system
  gem update
  gem cleanup -v
  npm outdated -g
}

export TERM=vt100
