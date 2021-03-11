source ~/.config/zsh/.zprofile

# Basic bash setting & themes
 export PATH=$PATH:$HOME/.bin
 export PATH=$PATH:$HOME/.bin/**/
 #path+='$HOME/.bin'
 #export PATH
 setopt no_list_ambiguous
 bindkey -v

 # Setting up Defaults
 export TERMINAL='alacritty'
 export BROWSER='firefox'

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
 alias w='nitrogen --set-zoom-fill --random ~/Media/wallpapers/backgrounds'
 alias ddate='date +"%R - %a, %B %d, %Y"'
 alias scp='sudo cp'
 alias lampp='sudo /opt/lampp/lampp' 
 alias lla='ls -a'
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
    


export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="spaceship"


plugins=(git)
source $ZSH/oh-my-zsh.sh

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# neofetch
neofetch

# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
(cat ~/.cache/wal/sequences &)

# Alternative (blocks terminal for 0-3ms)
cat ~/.cache/wal/sequences

# To add support for TTYs this line can be optionally added.
source ~/.cache/wal/colors-tty.sh
#neofetch --source ~/.config/neofetch/thumbnails/
