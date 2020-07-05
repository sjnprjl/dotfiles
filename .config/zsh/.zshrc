
source ~/.config/zsh/.zprofile

# Basic bash setting & themes
 PATH=$PATH:$HOME/.bin
 setopt no_list_ambiguous
 bindkey -v

 # Setting up Defaults
 export TERMINAL='alacritty'
 export BROWSER='firefox'

 # Aliases
 alias tsm='transmission-remote'
 alias v='vim'
 alias vi='vim'
 alias f='ranger'
 alias tty='tty-clock -C4 -c'
 alias todo='cat ~/Dropbox/writing/notes/To-do.md'
 alias todoe='nvim ~/Dropbox/writing/notes/To-do.md'
 alias commit='git add -A; git commit -m'
 alias reset='cd ~; clear; source ~/.config/zsh/.zprofile'
 alias fetch='clear && neofetch && fortune ~/.bin/quotes/quotes'
 alias pac='sudo pacman'
 alias s='startx'
 alias w='nitrogen --set-zoom-fill --random ~/Media/wallpapers/backgrounds'
 alias ddate='date +"%R - %a, %B %d, %Y"'
 alias scp='sudo cp'
 alias lampp='sudo /opt/lampp/lampp' 
 alias htdocs='cd /opt/lampp/htdocs'
 alias sn='shutdown now'
 alias vol='~/.bin/speaker-volume' 
 alias clock='tty-clock -c -s'
 alias repo='cd ~/Repo/dotfiles'
 # Git Prompt Settings
 autoload -Uz vcs_info
 precmd_vcs_info() { vcs_info }
 precmd_functions+=( precmd_vcs_info )
 setopt prompt_subst
 RPROMPT=\$vcs_info_msg_0_
 zstyle ':vcs_info:git:*' formats '%F{yellow}(%b)%r%f'
 zstyle ':vcs_info:*' enable git
    
#=============== # ZSH_THEMES ARRAY
# =============

themes=(
    "dieter"
    "fox"
    "frontcube"
    "fwalch"
    "gallifrey"
    "mikesh"
    "mrtazz"
    "muse"
    "mortalscumbag"
    "mira"
    "mikeh"
    "nanotech"
    "tjkirch"
    "tonotdo"
    "wuffers"
    "ys"
)

export ZSH="/home/sujan/.oh-my-zsh"
ZSH_THEME=${themes[$RANDOM % ${#themes[@]} - 1 ]}
ZSH_THEME=ys
plugins=(git)
source $ZSH/oh-my-zsh.sh

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# neofetch
neofetch



#Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
(cat ~/.cache/wal/sequences &)

# Alternative (blocks terminal for 0-3ms)
cat ~/.cache/wal/sequences

# To add support for TTYs this line can be optionally added.
source ~/.cache/wal/colors-tty.sh
