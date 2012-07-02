#!/opt/local/bin/zsh
############################################################## {{{1 ##########
#   $Author$
#   $Revision$
#   $Date$
#   $HeadURL$
############################################################## }}}1 ##########

source ${0:h}/Setup.command

setopt No_X_Trace;
setopt No_Err_Exit

if test "${USER}" = "root"; then
    port select gcc gcc42

    Update_Tree;
    Update_Packages;

    for I in		\
	"autoconf"	\
	"ctags"		\
	"gettext"	\
	"gnutar"	\
	"grep"		\
	"libiconv"	\
	"ncurses"	\
	"perl5"		\
	"python26"	\
	"ruby"		\
	"tcl"		;
    do
	Install_Update ${I} "${=General_Variants}";
    done; unset I

    for I in					\
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

    port select gcc gnat-gcc42
    Clean
else
    setopt Multi_OS;
    sudo ${0:a} 1>&1 2>&2 &>~/Library/Logs/${0:r:t}.out;
fi;

############################################################ {{{1 ###########
# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
