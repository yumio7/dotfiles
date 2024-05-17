if status is-interactive
    # Commands to run in interactive sessions can go here
    # cat ~/.cache/wal/sequences
    # fish_ssh_agent
    starship init fish | source
end
fish_add_path /home/yumio/.spicetify

# fish_ssh_agent

export XDG_CURRENT_DESKTOP=sway
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig/
export MPD_HOST="127.0.0.1"

# Created by `pipx` on 2024-03-22 23:37:50
set PATH $PATH /home/yumio/.local/bin
