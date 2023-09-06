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
	"cmake +python37+qt5+docs+gui"	\
	"doxygen +wizard"		\
	"gcc12"				\
	"gcc_select"			\
	"gdb"				\
	"llvm-15"			\
	"llvm-gcc42"			\
	"llvm_select"			\
	"m4"				\
	"universal-ctags +aspell"
    do
	Install_Update ${I} "${=General_Variants}"
    done; unset I
else
    setopt Multi_OS

    brew install	\
	cmake		\
	gcc		\
	gdb		\
	gmake		\
	universal-ctags

    sudo ${0:a} >&1 2>&2 &>~/Library/Logs/${0:r:t}.out
fi

############################################################ {{{1 ###########
# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
