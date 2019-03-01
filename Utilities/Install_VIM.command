#!/opt/local/bin/zsh
############################################################## {{{1 ##########
#   $Author: krischik@macports.org $
#   $Revision: 143895 $
#   $Date: 2015-12-25 08:11:12 +0100 (Fr, 25. Dez 2015) $
#   $HeadURL: http://svn.macports.org/repository/macports/users/krischik/Utilities/Install_VIM.command $
############################################################## }}}1 ##########

source ${0:h}/Setup.command

setopt No_XTrace
setopt No_Err_Exit

if test "${USER}" = "root"; then
    Deselect_System
    Update_Tree
    Update_Packages

    ${0:h}/Install_Perl.command
    ${0:h}/Install_Python.command
    ${0:h}/Install_Ruby.command

    for I in								    \
	"autoconf"							    \
	"ctags"								    \
	"gettext"							    \
	"gnutar"							    \
	"grep"								    \
	"libiconv"							    \
	"lua"								    \
	"ncurses"							    \
	"tcl"								    \
	"MacVim +cscope +huge +nls +ruby25 +python37 +lua +perl +tcl +xim"  \
	"vimproc"
    do
	Install_Update ${I} "${=General_Variants}"
    done; unset I

    #"vim +cscope +huge +nls +ruby22 +python35 +lua +perl +tcl +xim"	    \

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
	vimdiff
    do
	if test ! -e /opt/local/bin/${I};  then
	   gln --symbolic mvim /opt/local/bin/${I}
	fi
    done; unset I

    Select_System
    Clean
else
    setopt Multi_OS
    ${0:h}/Install_Perl.command
    ${0:h}/Install_Python.command
    ${0:h}/Install_Ruby.command

    brew cask install macdown
    brew install macvim 
    brew link macvim

    sudo ${0:a} 1>&1 2>&2 &>~/Library/Logs/${0:r:t}.out
fi

############################################################ {{{1 ###########
# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
