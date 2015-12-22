#!/opt/local/bin/zsh
############################################################## {{{1 ##########
#   $Author$
#   $Revision$
#   $Date$
#   $HeadURL$
############################################################## }}}1 ##########

source ${0:h}/Setup.command

setopt No_XTrace
setopt No_Err_Exit

if test "${USER}" = "root"; then
    Deselect_System
    Unload_System
    Update_Tree
    Update_Packages

    ${0:h}/Install_Python.command
    ${0:h}/Install_Gtk.command

    for I in						\
	"gnome-themes"					\
	"tango-icon-theme +big_icons"			\
	"tango-icon-theme-extras +big_icons"		\
	"gtk-theme-switch"				\
	"gtkspell2"					\
	"gconf"						\
	"gmime"						\
	"mono"						\
	"mono-addins"					\
	"gnome-control-center"				\
	"evolution-data-server+gtk_doc"			\
	"gimp-app"					\
	"gimp-help-de"					\
	"gimp2 +gvfs -help_browser +quartz"		\
	"gqview"					\
	"pan2"
    do
	Install_Update ${=I} "${=General_Variants}${=Gnome_Variants}"
    done; unset I

    Clean
    Load_System
    Select_System
else
    setopt Multi_OS

    Unload_User
    sudo ${0:a} 1>&1 2>&2 &>~/Library/Logs/${0:r:t}.out
    Load_User
fi

# To start gnome put "exec gnome-session" in your .xinitrc
# See also http://trac.macports.org/wiki/GNOME
# sudo launchctl load -w /Library/LaunchDaemons/org.macports.dbus.plist
#
# sudo port select python26
#
############################################################ {{{1 ###########
# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
