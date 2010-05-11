#!/opt/local/bin/zsh
############################################################## {{{1 ##########
#   $Author: krischik@macports.org $
#   $Revision: 52694 $
#   $Date: 2009-06-21 20:48:35 +0200 (So, 21. Jun 2009) $
#   $HeadURL: http://svn.macports.org/repository/macports/users/krischik/atari800/Upload.command $
############################################################## }}}1 ##########

source ${0:h}/Setup.command

setopt X_Trace;
setopt No_Err_Exit;

if test "${USER}" = "root"; then
    Clean;
    gfind "/opt/local"			    \
	-regextype grep			    \
	-iregex '.\+mp_[[:digit:]]\{10\}'   \
	-exec grm --verbose '{}' ';'
    gfind "/Applications/MacPorts"	    \
	-regextype grep			    \
	-iregex '.\+mp_[[:digit:]]\{10\}'   \
	-exec grm --verbose '{}' ';'
else
    setopt Multi_OS;

    sudo ${0:a} 1>&1 2>&2 &>~/Library/Logs/${0:r:t}.out;
fi;

############################################################ {{{1 ###########
# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
