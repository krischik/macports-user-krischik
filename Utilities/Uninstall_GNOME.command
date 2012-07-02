#!/opt/local/bin/zsh
############################################################## {{{1 ##########
#   $Author$
#   $Revision$
#   $Date$
#   $HeadURL$
############################################################## }}}1 ##########

source ${0:h}/Setup.command

setopt No_X_Trace;
setopt No_Err_Exit;

if test "${USER}" = "root"; then
    Unload_System;

    for I in						    \
	"gnome-control-center"				    \
	"gnome-platform-suite"				    \
	"gnome-desktop-suite"				    \
	"gnome-desktop"					    \
	"gnome-icon-theme"				    \
	"gnome-keyring"					    \
	"gnome-menus"					    \
	"gnome-mime-data"				    \
	"gnome-panel"					    \
	"gnome-session"					    \
	"gnome-settings-daemon"				    \
	"gnome-terminal"				    \
	"gnome-themes"
    do
	port uninstall --follow-dependents ${=I}
    done; unset I

    Clean;
    Load_System;
else
    setopt Multi_OS;

    Unload_User;
    sudo ${0:a} 1>&1 2>&2 &>~/Library/Logs/${0:r:t}.out;
    Load_User
fi;

# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
