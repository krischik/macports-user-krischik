#!/opt/local/bin/zsh
############################################################## {{{1 ##########
#   $Author: krischik@macports.org $
#   $Revision: 52694 $
#   $Date: 2009-06-21 20:48:35 +0200 (So, 21. Jun 2009) $
#   $HeadURL: http://svn.macports.org/repository/macports/users/krischik/atari800/Upload.command $
############################################################## }}}1 ##########

source ${0:a:h}/Setup.command

setopt X_Trace;
setopt No_Err_Exit;

if test "${USER}" = "root"; then
    Unload_System

    gcc_select gcc42

    Update;
    Force_Activate;
    No_Universal;
    Clean;

    gcc_select gnat-gcc
    
    Load_System;
else
    setopt Multi_OS;

    Unload_User;
    sudo ${0:a} 1>&1 2>&2 &>~/Library/Logs/${0:r:t}.out;
    Load_User;
fi;

############################################################ {{{1 ###########
# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
