# Path to your oh-my-zsh installation.
export ZSH=/Users/esa/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"

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


export HOMEBREW_CASK_OPTS="--appdir=/Applications"

export RBENV_ROOT=/usr/local/var/rbenv
eval "$(rbenv init -)"

LUNCHY_DIR=$(dirname `gem which lunchy`)/../extras
if [ -f $LUNCHY_DIR/lunchy-completion.zsh ]; then
  . $LUNCHY_DIR/lunchy-completion.zsh
fi

export NVM_DIR="$HOME/.nvm"
. "$(brew --prefix nvm)/nvm.sh"

fpath=(/usr/local/share/zsh-completions $fpath)


# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(bower brew-cask brew bundler colored-man colorize composer copydir copyfile cp dirhistory docker docker-compose ember-cli gem git git-extras github grunt heroku history last-working-dir node npm nvm osx postgres pow powify rails rake rbenv ruby ssh-agent sudo xcode zsh-syntax-highlighting)

# User configuration

# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="/usr/local/sbin:$PATH"
export PATH="$(brew --prefix homebrew/php/php70)/bin:$PATH"
export PATH=/Users/esa/.themekit:$PATH
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
alias edd="ember deploy development"
alias eds="ember deploy staging"
alias eo="npm outdated && bower list"
alias gt="git tag"
alias ls="ls -alGh"
alias nbd="cd ~/code/nbdlabel"
alias npmreset="rm -rf node_modules && npm cache clean && npm i"
alias q="exit"
alias weather="curl http://wttr.in/vancouver"

er() {
  rm -rf node_modules bower_components dist tmp
  npm cache clean
  npm i
  bower cache clean
  bower install
  eb
  es
}

fixpow() {
  brew uninstall pow
  brew install pow
  sudo pow --install-system
  pow --install-local
  lunchy stop pow
  lunchy start pow
}

gbump() {
  gcmsg "Bump to $1"
  gt -a $1 -m "Bump version $1"
}

update() {
  upgrade_oh_my_zsh
  bubu
  brew cask cleanup
  gem update --system
  gem update
  gem cleanup -V
  npm outdated -g
}

export TERM=vt100
