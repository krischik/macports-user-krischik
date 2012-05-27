#!/opt/local/bin/zsh

source ${0:h}/Setup.command

setopt X_Trace;

if test "${USER}" = "root"; then
    Unload_System;

    port select gcc gcc42

    Update_Tree;
    Update_Packages;

    for I in						    \
	"cairo"						    \
	"pango"						    \
	"gtk2"						    \
	"gtk-engines2"					    \
	"gnome-themes"					    \
	"tango-icon-theme +big_icons"			    \
	"tango-icon-theme-extras +big_icons"		    \
	"gtk-theme-switch"				    \
	"gtkspell2"					    \
	"gconf"						    \
	"gmime"						    \
	"mono"						    \
	"mono-addins"					    \
	"gqview"					    \
	"gimp2 gvfs+help_browser"			    \
	"gimp-app +animation +help_browser +gvfs"	    \
	"gimp-user-manual +de"				    \
	"pan2"						    ;
    do
	port install ${=I} ${=General_Variants} ${=Gnome_Variants}
    done; unset I

    port select gcc gnat-gcc42
    Clean;
    Load_System;    
else
    setopt Multi_OS;

    Unload_User;
    sudo ${0:a} 1>&1 2>&2 &>~/Library/Logs/${0:r:t}.out;
    Load_User
fi;

# To start gnome put "exec gnome-session" in your .xinitrc
# See also http://trac.macports.org/wiki/GNOME
# sudo launchctl load -w /Library/LaunchDaemons/org.macports.dbus.plist
# 
# sudo port select python26
#
# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
