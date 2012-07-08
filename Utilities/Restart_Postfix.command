#!/bin/zsh

setopt X_Trace;
setopt No_Err_Exit;


if test "${USER}" = "root"; then
    launchctl stop      "org.postfix.master"
    launchctl stop      "org.macports.postfix"
    launchctl unload -w "/Library/LaunchDaemons/org.macports.postfix.plist"
    launchctl unload -w "/System/Library/LaunchDaemons/org.postfix.master.plist"

    pushd "/opt/local/etc/postfix"
        postalias "aliases"
        postmap   "access"
        postmap   "canonical"
        postmap   "sender_canonical"
        postmap   "virtual"
        postmap   "relocated"
        postmap   "transport"
        postmap   "generic"
        postmap   "sasl_passwd"
        postmap   "header_checks"
    popd;

    launchctl load -w "/Library/LaunchDaemons/org.macports.postfix.plist"
    launchctl stop    "org.macports.postfix"
else
    sudo ${0};
fi;

# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 expandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
