#!/bin/echo usage: source
############################################################## {{{1 ##########
#   $Author: krischik@macports.org $
#   $Revision: 52694 $
#   $Date: 2009-06-21 20:48:35 +0200 (So, 21. Jun 2009) $
#   $HeadURL: http://svn.macports.org/repository/macports/users/krischik/atari800/Upload.command $
############################################################## }}}1 ##########

setopt No_X_Trace;

case "${OSTYPE}" in
    ((darwin10*))
	typeset  General_Variants="+universal"
    ;;
    ((darwin9*))
	typeset  General_Variants=""
    ;;
esac;

typeset       Qt_Variants="+docs+cocoa"
#typeset   Gnome_Variants="+quartz+no_X11"
typeset    Gnome_Variants="+x11"

if test -d "/Work/MacPorts/dports"; then
    typeset Base_Work_Dir="/Work/MacPorts/dports"
elif test -d "/Volumes/Shared/MacPorts/dports"; then
    typeset Base_Work_Dir="/Volumes/Shared/MacPorts/dports"
elif test -d "/Volumes/Shared-1/MacPorts/dports"; then
    typeset Base_Work_Dir="/Volumes/Shared-1/MacPorts/dports"
fi;

path=/opt/local/bin
path+=/bin
path+=/sbin
path+=/usr/bin
path+=/usr/sbin
path+=/usr/local/bin
path+=/usr/X11/bin

typeset -x -g -U -T PKG_CONFIG_PATH pkg_config_path ':';

pkg_config_path+="/opt/local/share/pkgconfig";
pkg_config_path+="/opt/local/libexec/qt4-mac/lib/pkgconfig";
pkg_config_path+="/opt/local/lib/pkgconfig";

function Load ()
    {
    local in_PList="${1}"

    if test -e ${in_PList}; then
	launchctl load -w ${in_PList}
    fi;

    return;    
    } # Load

function Load_System ()
    {
    Load "/Library/LaunchDaemons/org.macports.dbus.plist";
    Load "/Library/LaunchDaemons/org.macports.slapd.plist";
    Load "/Library/LaunchDaemons/org.freedesktop.dbus-system.plist";
    Load "/Library/LaunchDaemons/org.macports.gdm.plist";
    Load "/Library/LaunchDaemons/org.macports.rsyncd.plist";
    Load "/Library/LaunchDaemons/org.macports.spamd.plist";

    return;
    } # Load_System

function Load_User ()
    {
    Load "/Library/LaunchAgents/org.freedesktop.dbus-session.plist";

    if test -d /Applications/MacPorts/KDE4/kdeinit4.app; then
	open /Applications/MacPorts/KDE4/kdeinit4.app
    fi;

    return;
    } # Load_User

function Unload ()
    {
    local in_PList="${1}"

    if test -e ${in_PList}; then
	launchctl unload -w ${in_PList}
    fi;

    return;    
    } # Unload

function Unload_System ()
    {
    Unload "/Library/LaunchDaemons/org.macports.dbus.plist";
    Unload "/Library/LaunchDaemons/org.macports.rsyncd.plist";
    Unload "/Library/LaunchDaemons/org.macports.spamd.plist";
    Unload "/Library/LaunchDaemons/org.freedesktop.dbus-system.plist";
    Unload "/Library/LaunchDaemons/org.macports.gdm.plist";

    return;    
    } # Unload_System

function Unload_User ()
    {
    Unload "/Library/LaunchAgents/org.freedesktop.dbus-session.plist";

    return;
    } # Unload_User

function Install_Update ()
    {
    local in_Package="${1}";
    local in_Options="${2}";

    if ! port install -f ${=in_Package} ${=in_Options}; then
	port upgrade --enforce-variants ${=in_Package} ${=in_Options};	
    fi;

    port activate -f  ${=in_Package} ${=in_Options} || true;
    return
    } # Install_Update

function Force_Activate ()
    {
    local I;
    
    for I in						    \
	"dbus ${General_Variants}"			    \
	"oxygen-icons ${=Qt_Variants}${General_Variants}"   \
	"kdebase4-runtime ${=Qt_Variants}"		    \
	"kdelibs4 ${=Qt_Variants}"			    \
	"taglib-devel ${General_Variants}"		    \
	"gnome-menus ${Gnome_Variants}${General_Variants}"  ;
    do
	Install_Update ${I};
    done; unset I

    return
    } # Force_Activate

function No_Universal ()
    {
    local I;
    
    for I in				    \
	"dbacl"				    \
	"evolution-data-server"		    \
	"libgweather"			    \
	"openldap"			    \
	"python24"			    \
	"python25"			    \
	"python26"			    \
	"py25-cairo"			    \
	"py25-gobject"			    \
	"py25-gtk"			    \
	"dbus-python25"			    \
	"speex"				    ;
    do
	Install_Update ${I};
    done; unset I

    return
    } # No_Universal

function Update ()
    {
	setopt X_Trace;

    if test -d "${Base_Work_Dir}"; then
	pushd "${Base_Work_Dir}";
	    sudo svn cleanup
	    sudo svn revert PortIndex*
	    sudo svn update
	    sudo portindex
	popd;
    fi;

    port selfupdate;
    port sync;
    port deactivate kdelibs4;
    port upgrade --enforce-variants qt4-mac ${Qt_Variants} ${General_Variants} ;
    port activate kdelibs4 ${Qt_Variants};
    port -p upgrade --enforce-variants outdated ${General_Variants} ;

    return
    } # Update

function Clean ()
    {
    port -p uninstall inactive		    ;
    port -f clean --all all		    ;

    return
    } # Clean

############################################################ {{{1 ###########
# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
