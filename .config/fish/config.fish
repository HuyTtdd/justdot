function fish_prompt
    set _pwd (prompt_pwd)
    set _pwd (string split -m 1 -r / $_pwd)

    if set -q TMUX; and set -q VIRTUAL_ENV; and test "$VIRTUAL_ENV" != "/usr"; and test "$VIRTUAL_ENV" != ""
        echo -n -s '(' (basename "$VIRTUAL_ENV") ')' ' '
    end

    if test (count $_pwd) -eq 1
        printf '%s%s' (set_color "#f5e0dc" --bold) $_pwd[1]
    else
        printf '%s%s%s/%s' (set_color "#cba6f7" --dim) $_pwd[1] (set_color --bold) $_pwd[2]
    end

    printf '%s%s\n%s> ' (set_color green) (fish_git_prompt) (set_color "#cba6f7" --bold)
    set_color normal
end

function fish_greeting
    set_color '#f4b8e4'
    echo '*** VSCode is the best IDE ***'
    set_color normal
end

function fish_title
    echo $custom_title
end

function load_world
    set -g custom_title $argv[1]
end

function fish_mode_prompt
    switch $fish_bind_mode
        case default
            set_color white
            echo '[N] '
        case insert
            set_color '#ea76cb'
            echo '[I] '
        case replace_one
            set_color cyan
            echo '[R] '
        case visual
            set_color purple
            echo '[V] '
        case '*'
            set_color red
            echo '[?] '
    end
    set_color normal
end

function ktmux
    tmux kill-session -t $argv[1]
end

function atmux
    tmux attach-session -t $argv[1]
end

function mkcd
    if test -d $argv[1]
        echo $argv[1] existed
    else
        mkdir $argv[1]
        cd $argv[1]
    end
end

function loadenv
    set tmp (string split -r -m 2 / (which python))
    if set -q VIRTUAL_ENV
        set VIRTUAL_ENV $tmp[1]
    end
end

function timg
    wezterm imgcat --width 50 $argv[1]
end

function search
    ag $argv[1] | fzf
end

if status --is-interactive
    set fish_color_valid_path

    set -x EDITOR /usr/local/bin/nvim
    set __fish_git_prompt_show_informative_status 1

    fish_vi_key_bindings

    load_world 'The Matrix'

    alias nvim='/usr/local/bin/nvim'

    alias vim='nvim'
    alias vi='nvim'
    alias py='python3'

    alias tmux="systemd-run --scope --user tmux"
    alias ltmux="tmux list-sessions"
    alias ksmux="tmux kill-server"
    alias tbite="tmux new-session -t X -s T"

    abbr --add --global install "sudo apt install"
    abbr --add --global update "sudo apt update"
    abbr --add --global upgrade "sudo apt upgrade"
    abbr --add --global autoremove "sudo apt autoremove"

    source ~/.aliases.fish
    source ~/.config/fish/functions/fish_user_key_bindings.fish

    loadenv
end
