# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

umask 027

export EDITOR="/usr/bin/vim"

# Bash
export HISTFILE="$HOME/.bash_history_alt"
export HISTSIZE=1000000000
export HISTFILESIZE=-1
export PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

# Go
export PATH="$PATH:$(go env GOPATH)/bin"

# Dart
export PATH="$PATH:$HOME/.pub-cache/bin"

# Flutter
export PATH="$PATH:$HOME/flutter/bin"

# Android
export PATH="$PATH:$HOME/android/cmdline-tools/latest/bin"

# Fly.io
export FLYCTL_INSTALL="$HOME/.fly"
export PATH="$PATH:$FLYCTL_INSTALL/bin"
