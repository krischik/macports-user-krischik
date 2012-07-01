#!/opt/local/bin/zsh
############################################################## {{{1 ##########
#   $Author$
#   $Revision$
#   $Date$
#   $HeadURL$
############################################################## }}}1 ##########

source ${0:h}/Setup.command

setopt X_Trace;

if test "${USER}" = "root"; then
    port select gcc gcc42

    #Update_Tree;
    #Update_Packages;

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

    for I in	    \
	eview	    \
	evim	    \
	ex	    \
	gview	    \
	gvim	    \
	gvimdiff    \
	rgview	    \
	rgvim	    \
	rview	    \
	rvim	    \
	view	    \
	vim	    \
	vimdiff	    ;
    do
	if test ! -e /opt/local/bin/${I};  then
	   gln --symbolic mvim /opt/local/bin/${I};
	fi;
    done; unset I

    Clean;
    port select gcc gnat-gcc42
else
    setopt Multi_OS;
    sudo ${0:a} 1>&1 2>&2 &>~/Library/Logs/${0:r:t}.out;
fi;

############################################################ {{{1 ###########
# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
