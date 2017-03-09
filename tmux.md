# tmux

Install [powerline-status](https://powerline.readthedocs.io/en/latest/installation.html).

Copy and paste this into `~/.tmux.conf`

    set -g @plugin 'tmux-plugins/tpm'

    set -g @plugin 'tmux-plugins/tmux-resurrect'
    set -g @plugin 'tmux-plugins/tmux-continuum'
    set -g @plugin 'tmux-plugins/tmux-sensible'
    set -g @plugin 'tmux-plugins/tmux-yank'
    set -g @plugin 'tmux-plugins/tmux-pain-control'

    set -g @resurrect-capture-pane-contents 'on'
    set -g @continuum-restore 'on'

    set-window-option -g xterm-keys on

    source "/home/qasim/.local/lib/python3.5/site-packages/powerline/bindings/tmux/powerline.conf"

    run '~/.tmux/plugins/tpm/tpm'
    
Install the [tmux plugins](https://github.com/tmux-plugins/tpm) with `Prefix + I`
