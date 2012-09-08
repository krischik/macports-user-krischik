#!/opt/local/bin/zsh
############################################################## {{{1 ##########
#   $Author$
#   $Revision$
#   $Date$
#   $HeadURL$
############################################################## }}}1 ##########

source ${0:h}/Setup.command

setopt No_X_Trace
setopt No_Err_Exit

if test "${USER}" = "root"; then
    Clean
    echo "===> Remove Backup file in /opt/local"
    gfind "/opt/local"			    \
	-regextype grep			    \
	-iregex '.\+mp_[[:digit:]]\{10\}'   \
	-exec grm --verbose '{}' ';'
    echo "===> Remove Backup file in /Applications/MacPorts"
    gfind "/Applications/MacPorts"	    \
	-regextype grep			    \
	-iregex '.\+mp_[[:digit:]]\{10\}'   \
	-exec grm --verbose '{}' ';'
    echo "===> Remove Backup file in /Library/LaunchAgents"
    gfind "/Library/LaunchAgents"	    \
	-regextype grep			    \
	-iregex '.\+mp_[[:digit:]]\{10\}'   \
	-exec grm --verbose '{}' ';'
    echo "===> Remove Backup file in /Library/LaunchDaemons"
    gfind "/Library/LaunchDaemons"	    \
	-regextype grep			    \
	-iregex '.\+mp_[[:digit:]]\{10\}'   \
	-exec grm --verbose '{}' ';'
else
    setopt Multi_OS

    sudo ${0:a} 1>&1 2>&2 &>~/Library/Logs/${0:r:t}.out
fi

############################################################ {{{1 ###########
# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
