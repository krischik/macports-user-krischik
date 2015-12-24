#!/bin/zsh
############################################################## {{{1 ##########
#   $Author$
#   $Revision$
#   $Date$
#   $HeadURL$
############################################################## }}}1 ##########

source ${0:h}/Setup.command

setopt No_XTrace
setopt Multi_OS
setopt Err_Exit

if test "${USER}" = "root"; then
    xcode-select --switch /Applications/Developer/Xcode.app

    port install						    \
	"coreutils" ${=General_Variants}			    \
	"zsh" "+doc" "+mp_completion" ${=General_Variants}	    \
	1>&1 2>&2 &>~/Library/Logs/${0:r:t}.out

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
