#!/usr/local/bin/expect

set timeout -1

set pre "spawn "

set command  [lindex $argv 0]
set password [lindex $argv 1]

append cmdcall $pre " " $command

eval $cmdcall
expect {
    -regexp "(p|P)assword" {
        send "$password\r"
    }
    "Are\ you\ sure\ you\ want\ to\ continue\ connecting" {
        send "yes\r"
    }
    "Press\ RETURN\ to\ continue\ or\ any\ other\ key\ to\ abort" {
        send "\r"
    }
    default {
        exit 0
    }
}
interact
