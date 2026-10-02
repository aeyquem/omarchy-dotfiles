# File system
if command -q eza
    alias ls='eza -lh --group-directories-first --icons=auto'
    alias lsa='ls -a'
    alias lt='eza --tree --level=2 --long --icons --git'
    alias lta='lt -a'
end

# fzf runs preview commands with $SHELL -c, and the previews below use
# POSIX `case` syntax, so force bash for them.
function ff
    set -lx SHELL (command -v bash)
    if test "$TERM" = xterm-kitty
        fzf --preview 'case $(file --mime-type -b {}) in image/*) kitty icat --clear --transfer-mode=memory --stdin=no --place=${FZF_PREVIEW_COLUMNS}x${FZF_PREVIEW_LINES}@0x0 {} ;; *) bat --style=numbers --color=always {} ;; esac' $argv
    else
        fzf --preview 'bat --style=numbers --color=always {}' $argv
    end
end

function eff
    set -l file (ff)
    and test -n "$file"
    and begin
        set -l editor (string split -n ' ' -- $EDITOR)
        $editor $file
    end
end

function sff
    if test (count $argv) -eq 0
        echo "Usage: sff <destination> (e.g. sff host:/tmp/)"
        return 1
    end
    set -l file (find . -type f -printf '%T@\t%p\n' | sort -rn | cut -f2- | ff)
    if test -n "$file"
        scp "$file" $argv[1]
    end
end

# Requires `zoxide init fish | source` to be loaded first (provides `z`)
if command -q zoxide
    function zd
        if test (count $argv) -eq 0
            builtin cd ~; or return
        else if test -d "$argv[1]"
            builtin cd "$argv[1]"; or return
        else
            if not z $argv
                echo "Error: Directory not found"
                return 1
            end

            printf "\U000F17A9 "
            pwd
        end
    end
    alias cd='zd'
end

function open
    xdg-open $argv >/dev/null 2>&1 &
    disown
end

# Directories
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Tools
alias a='omarchy-agent --inline'
alias c='opencode --auto'
alias cy='codex --approve-for-me'
alias d='docker'
alias r='rails'
alias h='herdr'
alias ic='tdl c'
alias ix='tdl cx'
alias icx='tdl c cx'

function cx
    printf '\033[2J\033[3J\033[H'
    and claude --permission-mode auto $argv
end

function t
    tmux attach; or tmux new -s Work
end

function mup
    env MISE_MINIMUM_RELEASE_AGE=0 mise up $argv
end

function n
    if test (count $argv) -eq 0
        command nvim .
    else
        command nvim $argv
    end
end

# Git
alias g='git'
alias gcm='git commit -m'
alias gcam='git commit -a -m'
alias gcad='git commit -a --amend'
