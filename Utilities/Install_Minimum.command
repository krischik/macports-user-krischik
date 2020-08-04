#!/bin/zsh
############################################################## {{{1 ##########
#   $Author: krischik@macports.org $
#   $Revision: 143884 $
#   $Date: 2015-12-24 21:02:29 +0100 (Do, 24. Dez 2015) $
#   $HeadURL: http://svn.macports.org/repository/macports/users/krischik/Utilities/Install_Minimum.command $
############################################################## }}}1 ##########

source ${0:h}/Setup.command

setopt No_XTrace
setopt Multi_OS
setopt No_ErrExit

if test "${USER}" = "root"; then
    xcode-select --install
    xcode-select --switch /Applications/Xcode.app

    port install										\
	"coreutils" ${=General_Variants}							\
	"zsh" "+doc" "+mp_completion" ${=General_Variants}					\
	"subversion" "+bash_completion+tools+mod_dav_svn+unicode_path" "${=General_Variants}"	\
	1>&1 2>&2 &>~/Library/Logs/${0:r:t}.out

#   echo /opt/local/bin/zsh >>/etc/shells

    gchmod --verbose 755    "/Applications/Developer/Xcode.app/Contents/Developer/Library/PrivateFrameworks/CoreSimulator.framework/Versions/A/XPCServices/com.apple.CoreSimulator.CoreSimulatorService.xpc"
    gchown --verbose root   "/Applications/Developer/Xcode.app/Contents/Developer/Library/PrivateFrameworks/CoreSimulator.framework/Versions/A/XPCServices/com.apple.CoreSimulator.CoreSimulatorService.xpc"
    gchgrp --verbose wheel  "/Applications/Developer/Xcode.app/Contents/Developer/Library/PrivateFrameworks/CoreSimulator.framework/Versions/A/XPCServices/com.apple.CoreSimulator.CoreSimulatorService.xpc"

    ${0:h}/Install_VCS.command
    ${0:h}/Install_VIM.command
else
    setopt Multi_OS

    sudo ${0:a} 1>&1 2>&2 &>~/Library/Logs/${0:r:t}.out
fi

############################################################ {{{1 ###########
# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
