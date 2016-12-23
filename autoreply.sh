#!/usr/bin/expect

set timeout -1

set pre "spawn "

set command  [lindex $argv 0]
set password [lindex $argv 1]

append cmdcall $pre " " $command

eval $cmdcall
expect {
    "Password:" {
        send "$password\r"
        exp_continue
    }
    "Are you sure you want to continue connecting" {
        send "yes\r"
        exp_continue
    }
    "Press RETURN to continue or any other key to abort" {
        send "\r"
        exp_continue
    }
    eof {
        exit 0
    }
}
interact
