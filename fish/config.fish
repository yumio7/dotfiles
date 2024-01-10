if status is-interactive
    # Commands to run in interactive sessions can go here
    cat ~/.cache/wal/sequences
    fish_ssh_agent
    starship init fish | source
end
fish_add_path /home/yumio/.spicetify
