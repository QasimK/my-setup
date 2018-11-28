# ~/.config/fish/functions/fish_prompt.fish
# https://github.com/fish-shell/fish-shell/tree/master/share/tools/web_config/sample_prompts

function fish_prompt --description "Write out the prompt"
    set -l color_cwd
    set -l suffix
    set -l rstat
    set -l stat

    switch "$USER"
        case root toor
            if set -q fish_color_cwd_root
                set color_cwd $fish_color_cwd_root
            else
                set color_cwd $fish_color_cwd
            end
            set suffix '#'
        case '*'
            set color_cwd $fish_color_cwd
            set suffix '>'
    end

    set rstat $status
    set stat ""
    set __fish_color_status (set_color -o green)
    if test $rstat -gt 0
        set stat "[$rstat] "
        set __fish_color_status (set_color -o red)
    end

    echo -n -s "$__fish_color_status" "$stat" (set_color normal) "$USER" " " (set_color $color_cwd) (prompt_pwd) (set_color normal) "$suffix "
end
