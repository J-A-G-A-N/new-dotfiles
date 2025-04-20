# Define Editor
export EDITOR=nvim
bindkey -e

# -----------------------------------------------------
# ALIASES
# -----------------------------------------------------
alias c='clear'
alias nf='fastfetch'
alias pf='fastfetch'
alias ff='fastfetch'
alias ls='eza -a --icons'
alias ll='eza -al --icons'
alias lt='eza -a --tree --level=1 --icons'
alias shutdown='systemctl poweroff'
alias v='$EDITOR'
#alias vim='$EDITOR'
alias wifi='nmtui'
alias dot="cd ~/dotfiles"
alias zen-browser='/opt/zen-browser-bin/zen'
alias py312='conda activate py312'
alias dpy312='conda deactivate'
alias py='python3'
#alias livereload='/home/gluon/.config/miniconda3/envs/py312/bin/livereload'
#alias zigdoc='zen /home/gluon/work/compilers/zig/doc/langref.html & disown && exit'  
#alias exercism='~/work/sourcecode/GITHUB/bin/exercism'

#alias flash="/home/gluon/.arduino15/packages/vega/tools/vegaflasher/002/flasher.bat"
#alias tmuxs="~/work/sourcecode/tmux-sessionizer/tmux-sessionizer"
#alias playmusic="~/work/shell_scripts/play-music.sh"
#alias  yt-dl='py /home/gluon/work/sourcecode/youtube-dl/youtube_dl/__main__.py -o "/home/gluon/Downloads/ext/%(title)s.%(ext)s"'

# -----------------------------------------------------
# GIT
# -----------------------------------------------------
alias gs="git status"
alias ga="git add"
alias gc="git commit -m"
alias gp="git push"
alias gpl="git pull"
alias gst="git stash"
alias gsp="git stash; git pull"
alias gcheck="git checkout"
alias gcredential="git config credential.helper store"
alias tetris="qemu-system-i386 ~/OS/boot.bin"

# -----------------------------------------------------
# SYSTEM
# -----------------------------------------------------
alias update-grub='sudo grub-mkconfig -o /boot/grub/grub.cfg'

# -----------------------------------------------------
# START STARSHIP
# -----------------------------------------------------
eval "$(starship init zsh)"

# -----------------------------------------------------
# START ZOXIDE
# -----------------------------------------------------
 eval "$(zoxide init zsh)"

# -----------------------------------------------------
# SOURCE
# -----------------------------------------------------
source ~/work/shell_scripts/pomodoro-shell.sh
eval "$(/home/gluon/.local/miniconda3/bin/conda shell.zsh hook)"

# -----------------------------------------------------
# ZINIT
# -----------------------------------------------------
ZINIT_HOME="${HOME}/.local/share/zinit/zinit.git"

if [ ! -d "$ZINIT_HOME" ]; then
	mkdir -p "$(dirname $ZINIT_HOME)"
	git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi 

source "${ZINIT_HOME}/zinit.zsh"

zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

autoload -U compinit && compinit
# -----------------------------------------------------
# ZINIT-END
# -----------------------------------------------------


# mounting android phone
mountphone() {
    MOUNT_POINT=/mnt/android
    # Create mount point if it doesn't exist
    [ ! -d "$MOUNT_POINT" ] && mkdir -p "$MOUNT_POINT"
    # Mount the Android device using jmtpfs
    jmtpfs "$MOUNT_POINT"
    if [ $? -eq 0 ]; then
		notify-send  "Android device mounted at $MOUNT_POINT"
    else
        notify-send "Failed to mount Android device"
    fi
}

# Function to unmount the Android device
umountphone() {
    MOUNT_POINT=/mnt/android
    # Unmount the Android device
    fusermount -u "$MOUNT_POINT"
    if [ $? -eq 0 ]; then
        notify-send "Android device unmounted from $MOUNT_POINT"
    else
        notify-send "Failed to unmount Android device"
    fi
}

vimwiki(){
	cd ~/Documents/Wiki/sources/
	nvim index.md
}

zigv0-13(){
export PATH="/home/gluon/work/sourcecode/zig/zig-v0.13/zig:$PATH" 
}

zigv0-14(){
export PATH="/home/gluon/work/sourcecode/zig/zig-v0.14.0-stable/zig-linux-x86_64-0.14.0/:$PATH" 
}

zig-zg-v0.14(){
export PATH="/home/gluon/work/sourcecode/zig/zig-zg-v0.14/:$PATH" 
}
zig-mod(){
export PATH="/home/gluon/work/sourcecode/github-clone/zig-tracy/zigmod-r93/zig-out/bin/:$PATH"
}

#export PATH="/home/gluon/work/sourcecode/zig:$PATH" 
export NVM_DIR="$HOME/.local/opt/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


export PATH="$PATH:/home/gluon/.modular/bin"
eval "$(magic completion --shell zsh)"
