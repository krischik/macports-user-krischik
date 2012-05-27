#!/opt/local/bin/zsh

source ${0:h}/Setup.command

setopt No_X_Trace;
setopt Err_Exit;

if test "${USER}" = "root"; then
    sudo gchown -R ${1} ~/Library/Preferences/KDE
    Load_System;
else
    setopt Multi_OS;

    sudo ${0:a} ${USER} 1>&1 2>&2 &>~/Library/Logs/${0:r:t}.out;
    Load_User;
fi;

# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
