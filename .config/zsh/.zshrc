source ~/.config/zsh/.zprofile

export LC_ALL="en_US.UTF-8"
export LANG=en_US.UTF-8

autoload -U colors && colors

autoload -Uz compinit
compinit
zmodload zsh/complist
_comp_options+=(globdots)

export KEYTIMEOUT=1

bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'j' vi-down-line-or-history


# Basic bash setting & themes
 export PATH=$PATH:$HOME/.bin
 export PATH=$PATH:$HOME/.local/bin
 setopt no_list_ambiguous

 # Setting up Defaults
 export TERMINAL='kitty'
 export WALLPAPERS='$HOME/.wallpapers'

 # Aliases
 alias v='nvim'
 alias n='nnn'
 alias docker='sudo docker'
 alias docker-compose='sudo docker-compose'
 alias vi='nvim'
 alias tty='tty-clock -C4 -c'
 alias pac='sudo pacman'
 alias ddate='date +"%R - %a, %B %d, %Y"'
 alias scp='sudo cp'
 alias lla='ls -a'
 alias sn='shutdown now'
 alias clock='tty-clock -c -s'
 alias lg="git log --graph --abbrev-commit --decorate --date=relative --format=format:'%C(red)%h%C(r) —— %C(bold blue)%an%C(r): %C(white)%s%C(r) %C(dim white) %C(bold green)(%ar)%C(r) %C(bold yellow)%d%C(r)' --all | emojify | less -r"
 alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME' 
 alias cmatrix='cmatrix | lolcat'
 alias netbeans='netbeans -J-Dswing.aatext=TRUE -J-Dawt.useSystemAAFontSettings=on'
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
ZSH_THEME=$themes[3]

# VARIABLES
ZSH_AUTOSUGGEST_USE_ASYNC=true

plugins=(
    git
    github
    archlinux 
    battery 
    colorize 
    gitfast 
    zsh-syntax-highlighting
    zsh-autosuggestions
    vi-mode
    poetry
)
source $ZSH/oh-my-zsh.sh

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# neofetch
#neofetch
colors=(
    panes
    colorwheel
    hex
    crunchbang-mini
    elfman
)
color=${colors[$RANDOM % ${#colors[@]} + 1 ]}
#color=panes
pfetch | lolcat
#colorscript -e $color 
#colorscript -r

# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
#(cat ~/.cache/wal/sequences &)

# To add support for TTYs this line can be optionally added.
#source ~/.cache/wal/colors-tty.sh
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

bindkey -v

VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true
VI_MODE_SET_CURSOR=true
MODE_INDICATOR="%F{yellow}+%f"




ulimit -s unlimited
function gi() { curl -sLw n https://www.toptal.com/developers/gitignore/api/$@ ;}
