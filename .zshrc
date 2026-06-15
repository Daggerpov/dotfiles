
# Kiro CLI pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.pre.zsh"

# Linux-only: linuxbrew + zoxide (z) for Amazon dev desktops
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  if [ -x /home/linuxbrew/.linuxbrew/bin/brew ]; then
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
  fi
  if command -v zoxide >/dev/null 2>&1; then
    eval "$(zoxide init zsh --cmd z)"
  fi
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
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

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	git
	zsh-autosuggestions
	z
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
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias config='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export NVM_DIR=~/.nvm
if command -v brew >/dev/null 2>&1 && [ -s "$(brew --prefix nvm 2>/dev/null)/nvm.sh" ]; then
  source "$(brew --prefix nvm)/nvm.sh"
fi
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/daggerpov/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/daggerpov/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/daggerpov/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/daggerpov/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=${PATH}:/usr/local/mysql/bin/

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

bindkey -v

alias update-zen='sudo plutil -convert xml1 /Library/Managed\ Preferences/app.zen-browser.zen.plist && sudo plutil -replace DisableAppUpdate -bool false /Library/Managed\ Preferences/app.zen-browser.zen.plist'
alias update-zen-manual='sudo plutil -convert xml1 /Library/Managed\ Preferences/app.zen-browser.zen.plist && sudo vim /Library/Managed\ Preferences/app.zen-browser.zen.plist'

# --- KiRoom: start (or attach to) the local server ----------------------------
# `kiroom`        -> start the server if it's not already up; print the laptop
#                    ssh -L tunnel line + URL either way. Idempotent — won't
#                    spawn a second server that'd collide on :3000.
# `kiroom -f`     -> force a fresh start (kill any running server first).
# `kiroom stop`   -> stop the running server.
kiroom() {
  local pkg="$HOME/workplace/KiRoom/src/KiRoom"
  local tunnel="ssh -L 3000:localhost:3000 ${USER}@$(hostname -f 2>/dev/null)"
  local running; running="$(pgrep -f 'kiroom-server/index.js' 2>/dev/null | head -1)"
  [ -d "$pkg" ] || { echo "kiroom: $pkg not found"; return 1; }

  if [ "$1" = "stop" ]; then
    [ -n "$running" ] && { kill "$running" && echo "kiroom: stopped (pid $running)"; } || echo "kiroom: not running"
    return 0
  fi
  if [ "$1" = "-f" ] && [ -n "$running" ]; then
    echo "kiroom: restarting (killing pid $running)…"; kill "$running"; sleep 1; running=""
  fi
  if [ -n "$running" ]; then
    echo "kiroom: already running (pid $running) → http://localhost:3000"
    echo "  laptop tunnel:  $tunnel"
    return 0
  fi
  echo "kiroom: starting server (builds on first run; ~1-2 min)…"
  echo "  once up, from your laptop:  $tunnel"
  ( cd "$pkg" && brazil-build server )
}

export PATH=$HOME/.toolbox/bin:$PATH
if [ -x /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi
# Set up mise for runtime management
if command -v mise >/dev/null 2>&1; then
  eval "$(mise activate zsh)"
fi
[ -f /Users/dagapov/.brazil_completion/zsh_completion ] && source /Users/dagapov/.brazil_completion/zsh_completion
[ -f "$HOME/.brazil_completion/zsh_completion" ] && source "$HOME/.brazil_completion/zsh_completion"
[[ "$OSTYPE" == "darwin"* ]] && export JAVA_HOME="/Library/Java/JavaVirtualMachines/amazon-corretto-26.jdk/Contents/Home"

# Added by AIM CLI
export PATH="$HOME/.aim/mcp-servers:$PATH"


# Kiro CLI post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.post.zsh"

[[ "$TERM_PROGRAM" == "kiro" ]] && . "$(kiro --locate-shell-integration-path zsh)"

# MeshClaw
export PATH="$HOME/.local/bin:$PATH"
export MESHCLAW_PROJECT_DIR="/home/dagapov/.meshclaw-app"

# if you wish to use IMDS set AWS_EC2_METADATA_DISABLED=false

export AWS_EC2_METADATA_DISABLED=true


# Added by AIM CLI
export PATH="/local/home/dagapov/.aim/mcp-servers:$PATH"
