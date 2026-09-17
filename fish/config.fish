if status is-interactive
    # Commands to run in interactive sessions can go here
end

function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    command yazi $argv --cwd-file="$tmp"
    if read -z cwd <"$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

# Disable the fish greeting
set -g fish_greeting

starship init fish | source

zoxide init fish | source

# =============
# ABBREVIATIONS
# =============

# General
abbr --position anywhere -a hx helix

# Git
abbr --position anywhere -a ga git add .
abbr --position anywhere -a gcm git commit -m
abbr --position anywhere -a gst git status
abbr --position anywhere -a gca git commit --amend --no-amend
abbr --position anywhere -a gri git rebase --interactive
abbr --position anywhere -a grc git rebase --continue

# Pacman
abbr --position anywhere -a pacs sudo pacman -S
abbr --position anywhere -a pacq pacman -Qi
abbr --position anywhere -a pacr sudo pacman -R

# Paths
abbr --position anywhere -a fishc ~/.config/fish/config.fish
