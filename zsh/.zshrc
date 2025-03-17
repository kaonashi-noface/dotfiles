########################################
# PATH CONFIGURATIONS
########################################
# include binaries & packages in PATH
export PATH="/usr/bin:/usr/share:$PATH"

# Define .config directory
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"

# Initialize Starship
eval "$(starship init zsh)"

########################################
# ZSH INSTALLATION
########################################
# Setup zsh plugins
source ~/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.config/zsh/zsh-completions/zsh-completions.plugin.zsh
source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/zsh/zsh-history-substring-search/zsh-history-substring-search.zsh
source ~/.config/zsh/zsh-you-should-use/you-should-use.plugin.zsh
source ~/.config/zsh/zsh-256color/zsh-256color.plugin.zsh

########################################
# ZSH PLUGIN ALIASES
########################################
# Setup Substring Search Aliases
bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down

########################################
# ZSH CONFIGURATIONS
########################################
# Setup zsh history
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Setup zsh completion
zstyle ":completion:*" list-colors "${(s.:.)LS_COLORS}"

########################################
# CUSTOM ALIASES
########################################
# Setup directory navigation aliases
alias ..="cd .."
alias .2="cd ../.."
alias .3="cd ../../.."
alias .4="cd ../../../.."
alias .5="cd ../../../../.."
alias mkdir="mkdir -p"
alias ls="ls --color"

# Setup zsh utility aliases
# TODO - zsh update plugins (git clone all repositories in .config/zsh directory)
# alias zshup=""

########################################
# Runtime Environment Configurations
########################################
# Setup NVM
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[[ -r $NVM_DIR/bash_completion ]] && \. $NVM_DIR/bash_completion # This loads nvm bash_completion

# Run neofetch & display pokemon
pokemon-colorscripts --no-title -r 1,3,6
neofetch
