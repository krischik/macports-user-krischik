#!/opt/local/bin/zsh
############################################################## {{{1 ##########
#   $Author: krischik@macports.org $
#   $Revision: 143806 $
#   $Date: 2015-12-22 14:08:15 +0100 (Di, 22. Dez 2015) $
#   $HeadURL: http://svn.macports.org/repository/macports/users/krischik/Utilities/Install_Python.command $
############################################################## }}}1 ##########

source ${0:h}/Setup.command

setopt No_XTrace
setopt No_Err_Exit

if test "${USER}" = "root"; then
    for I in			\
	"python37"		\
	"python38"		\
	"py38-crypto"		\
	"py38-gnureadline"	\
	"py38-tkinter"		\
	"py38-xlwt"		\
	"py38-pip"		\
	"py38-pygments"		\
	"py38-xlwt"		
    do
	Install_Update ${I} "${=General_Variants}"
    done; unset I

    # the following pyton moduls can't be compiled with
    # universal as py27-numpy has no universal variant
    #
    for I in			\
	"py38-numpy"		\
	"py38-cairo"		\
	"py38-pygtk"
    do
	Install_Update ${I}
    done; unset I
else
    setopt Multi_OS

    brew install python
fi

############################################################ {{{1 ###########
# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
