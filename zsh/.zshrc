#
# Ansible managed
#


# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="dieter"

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
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(autojump command-not-found docker docker-compose encode64 git git-flow github history-substring-search pip systemd cdenv colored-man docker-extra example findm grepr mclone)

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias via='~/.via/via-3.0.0-linux.AppImage'
alias dockerprune='docker system prune --all --volumes=false'
alias spotmindvpn='sudo openvpn --config /etc/openvpn/profile-228.ovpn'
alias dockerstop='docker stop $(docker ps -aq)'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

syncobs() {
    # Store the current directory to return to it later
    local ORIGINAL_DIR=$(pwd)
    
    # Navigate to your Obsidian vault
    cd ~/Documents/'ObsidianVault' || {
        echo "❌ Failed to navigate to Obsidian vault directory"
        return 1
    }

    # Get current date and time in a readable format
    local TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")
    
    # Check if we're in a git repository
    if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
        echo "❌ Not a git repository. Please initialize git first."
        cd "$ORIGINAL_DIR"
        return 1
    fi

    # Check for any changes to commit
    if ! git status --porcelain | grep '^'; then
        echo "✨ Nothing to commit - vault is up to date"
        cd "$ORIGINAL_DIR"
        return 0
    fi

    # Try to add all changes
    if ! git add .; then
        echo "❌ Failed to stage changes"
        cd "$ORIGINAL_DIR"
        return 1
    fi

    # Try to commit with the timestamp
    if ! git commit -m "Vault backup: $TIMESTAMP"; then
        echo "❌ Failed to commit changes"
        git reset  # Undo the staging if commit fails
        cd "$ORIGINAL_DIR"
        return 1
    fi

    # Check if we have a remote repository configured
    if ! git remote | grep '^origin'; then
        echo "❌ No remote repository configured"
        cd "$ORIGINAL_DIR"
        return 1
    fi

    # Try to push the changes
    if ! git push origin main; then
        echo "❌ Failed to push changes to remote repository"
        echo "💡 You might need to pull changes first or check your internet connection"
        cd "$ORIGINAL_DIR"
        return 1
    fi

    echo "✅ Successfully backed up and pushed vault at $TIMESTAMP"
    
    # Return to original directory
    cd "$ORIGINAL_DIR"
    return 0
}
