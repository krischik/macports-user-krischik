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

    port select --set python python27
    port select --set python2 python27
    port select --set cython cython27

    ${0:h}/Install_Python.command

    for I in						\
	"cairo"						\
	"gconf"						\
	"gmime"						\
	"gexiv2 +python39"				\
	"gtk-engines2"					\
	"gtk-theme-switch"				\
	"gtk2"						\
	"gtk3"						\
	"gtkspell2"					\
	"pango"
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
	"gnome-terminal +nautilus"			\
	"hicolor-icon-theme"				\
	"mono"						\
	"mono-addins"					\
	"tango-icon-theme +big_icons"			\
	"tango-icon-theme-extras +big_icons"		
    do
	Install_Update ${=I} "${=General_Variants}${=Gnome_Variants}"
    done; unset I

    for I in					    \
	"gimp2 +quartz"				    \
	"gimp2-launcher"			    \
	"gimp-help-en"				    \
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

# sudo port install gimp2 +quartz  gqview +quartz  nonpareil +quartz  gtk-theme-switch +quartz  gtk-engines2 +quartz  libcanberra +quartz gtk-sharp2 +quartz  libglade2 +quartz  gtkspell2 +quartz 
# sudo port install  py27-pygtk +quartz gqview +quartz gtk-theme-switch +quartz gtk-engines2 +quartz libcanberra +quartz

# To start gnome put "exec gnome-session" in your .xinitrc
# See also http://trac.macports.org/wiki/GNOME
# sudo launchctl load -w /Library/LaunchDaemons/org.macports.dbus.plist
#
# sudo port select python26
#
############################################################ {{{1 ###########
# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
