#!/opt/local/bin/zsh
############################################################## {{{1 ##########
#   $Author: krischik@macports.org $
#   $Revision: 52694 $
#   $Date: 2009-06-21 20:48:35 +0200 (So, 21. Jun 2009) $
#   $HeadURL: http://svn.macports.org/repository/macports/users/krischik/atari800/Upload.command $
############################################################## }}}1 ##########

source ${0:h}/Setup.command

setopt X_Trace;

if test "${USER}" = "root"; then
    gcc_select gcc42

    Update;
    No_Universal;
    Foce_Activate;

    for I in					\
	"gnutar ${=General_Variants}"		\
	"grep ${=General_Variants}"		\
	"ncurses ${=General_Variants}"		\
	"libiconv ${=General_Variants}"		\
	"ctags ${=General_Variants}"		\
	"perl5 ${=General_Variants}"		\
	"python26 ${=General_Variants}"		\
	"autoconf ${=General_Variants}"		\
	"ruby ${=General_Variants}"		\
	"tcl ${=General_Variants}"		\
	"gettext ${=General_Variants}"		\
	"MacVim +cscope +huge +nls +ruby +xim"	;
    do
	Install_Update ${I};
    done; unset I

    for I in eview evim ex gview gvim gvimdiff rgview rgvim rview rvim view vim vimdiff; do
	if test ! -e /opt/local/bin/${I};  then
	   gln --symbolic						\
		/Applications/MacPorts/MacVim.app/Contents/MacOS/Vim	\
		/opt/local/bin/${I}					;
	fi;
    done; unset I
    gcc_select gnat-gcc
else
    setopt Multi_OS;
    sudo ${0:a} 1>&1 2>&2 &>~/Library/Logs/${0:r:t}.out;
fi;

############################################################ {{{1 ###########
# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
