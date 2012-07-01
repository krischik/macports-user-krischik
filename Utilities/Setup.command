#!/bin/echo usage: source
############################################################## {{{1 ##########
#   $Author$
#   $Revision$
#   $Date$
#   $HeadURL$
############################################################## }}}1 ##########

setopt No_X_Trace;

case "${OSTYPE}" in
    ((darwin11*))
	typeset  General_Variants="+universal"
    ;;
    ((darwin10*))
	typeset  General_Variants="+universal-atlas"
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
    Load "/Library/LaunchDaemons/org.macports.dovecot.plist";
    Load "/Library/LaunchDaemons/org.macports.mysql5.plist";

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
    #Unload "/Library/LaunchDaemons/org.macports.dovecot.plist";

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
    local in_Options="${2} ${3} ${4}";

    echo "===> Install  ${=in_Package} ${=in_Options}"

    if ! port -f install ${=in_Package} ${=in_Options}; then
	port upgrade --enforce-variants ${=in_Package} ${=in_Options};	
    fi;

    port activate ${=in_Package} ${=in_Options} || true;
    return
    } # Install_Update

function Update_Tree ()
    {
    if test -d "${Base_Work_Dir}"; then
	pushd "${Base_Work_Dir}";
	    typeset Archive_Owner="$(gstat -c %U .)";
	    typeset Archive_Group="$(gstat -c %G .)";

	    svn cleanup
	    svn revert PortIndex*
	    svn update
	    portindex
	    gchown --recursive ${Archive_Owner}:${Archive_Group} .
	popd;
    fi;

    echo "===> Self Update"
    port selfupdate;
    echo "===> Sync"
    port sync;

    return
    } # Update_Tree
    
function Update_Packages ()
    {
    port -p upgrade --enforce-variants outdated ${General_Variants};

    return
    } # Update_Packages

function Clean ()
    {
    echo "===> Clean"
    port -p uninstall inactive;
    port -p uninstall outdated;
    port -f -q clean --all all >/dev/null;

    return
    } # Clean

############################################################ {{{1 ###########
# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
