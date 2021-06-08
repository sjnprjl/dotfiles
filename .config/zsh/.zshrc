source ~/.config/zsh/.zprofile

# Basic bash setting & themes
 export PATH=$PATH:$HOME/.bin
 export PATH=$PATH:$HOME/.bin/**/
 export PATH=/home/$USER/.config/nvcode/utils/bin:$PATH
 #path+='$HOME/.bin'
 #export PATH
 setopt no_list_ambiguous
 bindkey -v

 # Setting up Defaults
 export TERMINAL='kitty'
 export BROWSER='google-chrome-stable'
 export WALLPAPERS='$HOME/.wallpapers'

 # Aliases
 alias tcli='transmission-cli'
 alias fde='firefox-developer-edition'
 alias tsm='transmission-remote'
 alias v='nvim'
 alias vi='nvim'
 alias f='ranger'
 alias tty='tty-clock -C4 -c'
 alias commit='git add -A; git commit -m'
 alias reset='cd ~; clear; source ~/.config/zsh/.zprofile'
 alias pac='sudo pacman'
 alias s='startx'
 alias ddate='date +"%R - %a, %B %d, %Y"'
 alias scp='sudo cp'
 alias lampp='sudo /opt/lampp/lampp' 
 alias lla='ls -a'
 alias htdocs='cd /opt/lampp/htdocs'
 alias sn='shutdown now'
 alias vol='~/.bin/speaker-volume' 
 alias clock='tty-clock -c -s'
 alias repo='cd ~/Repo/dotfiles'
 alias wwal='wal -i'
 # Git Prompt Settings
 autoload -Uz vcs_info
 precmd_vcs_info() { vcs_info }
 precmd_functions+=( precmd_vcs_info )
 setopt prompt_subst
 RPROMPT=\$vcs_info_msg_0_
 zstyle ':vcs_info:git:*' formats '%F{yellow}(%b)%r%f'
 zstyle ':vcs_info:*' enable git
    


export ZSH="$HOME/.oh-my-zsh"
themes=(
    "half-life"
    "robbyrussell"
    "afowler"
    "alanpeabody"
    "bira"
    "bureau"
    "crunch"
    "emotty"
    "gentoo"
    "gozilla"
    "kennethreitz"
    )
ZSH_THEME=$themes[11]

# VARIABLES
ZSH_AUTOSUGGEST_USE_ASYNC=true

plugins=(
    git
    archlinux 
    battery 
    colorize 
    django 
    gitfast 
    zsh-autosuggestions
    zsh-syntax-highlighting
)
source $ZSH/oh-my-zsh.sh

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# neofetch
neofetch

# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
(cat ~/.cache/wal/sequences &)

# To add support for TTYs this line can be optionally added.
source ~/.cache/wal/colors-tty.sh
#neofetch --source ~/.config/neofetch/thumbnails/
### Fix slowness of pastes with zsh-syntax-highlighting.zsh
pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic # I wonder if you'd need `.url-quote-magic`?
}

pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}
zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish
### Fix slowness of pastes

autoload -Uz compinit
compinit
# Completion for kitty
kitty + complete setup zsh | source /dev/stdin


