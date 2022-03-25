#!/opt/local/bin/zsh
############################################################## {{{1 ##########
#   $Author: krischik@macports.org $
#   $Revision: 94920 $
#   $Date: 2012-07-02 14:29:54 +0200 (Mo, 02. Jul 2012) $
#   $HeadURL: http://svn.macports.org/repository/macports/users/krischik/Utilities/Uninstall_KDE4.command $
############################################################## }}}1 ##########

setopt No_XTrace
setopt No_Err_Exit

if test "${USER}" = "root"; then
    for I in				\
	"ext4fuse"	    		\
	"gcc6"              		\
	"llvm-3.7"	    		\
	"llvm-3.9"	    		\
	"osxfuse"	    		\
	"macfuse"	    		\
	"VeraCrypt"	    		\
	"yasm"				\
	"antenna"			\
	"apache2"			\
	"docker"			\
	"fontforge"			\
	"gcc6"				\
	"gcc8"				\
	"llvm-3.7"			\
	"llvm-3.9"			\
	"maven31"			\
	"maven32"			\
	"microemu"			\
	"openjdk11"			\
	"scala2.11"			\
	"scala2.11-docs"		\
	"yasm"				\
	"git"				\
	"git-extras"			\
	"git-crypt"			\
	"git-flow"			\
	"git-flow-bash-completion"	\
	"git-cvs"			\
	"git-lfs"			\
	"GitX"
    do
	echo "uninstall ${=I}"
	port uninstall --follow-dependents ${=I}
    done; unset I
else
    setopt Multi_OS

    sudo ${0} 1>&1 2>&2 &>~/Library/Logs/${0:r:t}.out

    for I in		    \
	"imapfilter"	    \
	"openjdk"	    \
	"osxfuse"
    do
	echo "uninstall ${=I}"
	brew uninstall --ignore-dependencies ${=I}
    done; unset I
fi

############################################################ {{{1 ###########
# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
