#!/opt/local/bin/zsh
############################################################## {{{1 ##########
#   $Author: krischik@macports.org $
#   $Revision: 143895 $
#   $Date: 2015-12-25 08:11:12 +0100 (Fr, 25. Dez 2015) $
#   $HeadURL: http://svn.macports.org/repository/macports/users/krischik/Utilities/Install_GNOME.command $
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

    for I in						\
	"cairo +universal"				\
	"gconf +universal"				\
	"gmime"						\
	"gtk-engines2"					\
	"gtk-theme-switch"				\
	"gtk2"						\
	"gtk3 +universal"				\
	"gtkspell2"					\
	"pango +universal"
    do
	Install_Update ${=I} "${=General_Variants}${=Gnome_Variants}"
    done; unset I

    for I in						\
	"adwaita-icon-theme"				\
	"gnome-control-center"				\
	"gnome-icon-theme"				\
	"gnome-icon-theme-extras"			\
	"gnome-icon-theme-symbolic"			\
	"gnome-mime-data"				\
	"gnome-theme"					\
	"gnome-themes-standard"				\
	"hicolor-icon-theme"				\
	"mono"						\
	"mono-addins"					\
	"tango-icon-theme +big_icons"			\
	"tango-icon-theme-extras +big_icons"		
    do
	Install_Update ${=I} "${=General_Variants}${=Gnome_Variants}"
    done; unset I

    for I in					    \
	"gimp-app +animation+help_browser"	    \
	"gimp-help-en"				    \
	"gimp2 +help_browser"			    \
	"gqview"				    \
	"pan2"
    do
	Install_Update ${=I} "${=Gnome_Variants}"
    done; unset I

    Load_System
    Select_System
    Clean
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
