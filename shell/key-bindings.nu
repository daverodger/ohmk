let oh_bindings = [
    {
            name: "ohmk search"
            modifier: control
            keycode: char_g
            mode: [emacs vi_normal vi_insert]
            event: {
                    send: executehostcommand
                    cmd: "commandline | ohmk -s $in e>| commandline edit -r $in"
            }
    }
    {
            name: "ohmk input"
            modifier: control
            keycode: char_b
            mode: [emacs vi_normal vi_insert]
            event: {
                    send: executehostcommand
                    cmd: 'commandline | ohmk -i $in e>| commandline edit -r $in'
            }
    }
]

$env.config.keybindings ++= $oh_bindings
