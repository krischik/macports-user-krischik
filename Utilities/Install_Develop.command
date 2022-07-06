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
    for I in				\
	"autoconf"			\
	"automake"			\
	"cmake +python37+qt5+docs+gui"  \
	"ctags"				\
	"doxygen +wizard"		\
	"gcc10"				\
	"gcc_select"			\
	"llvm-8.0"			\
	"llvm-gcc42"			\
	"llvm_select"			\
	"m4"
    do
	Install_Update ${I} "${=General_Variants}"
    done; unset I
else
    setopt Multi_OS
fi

############################################################ {{{1 ###########
# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
