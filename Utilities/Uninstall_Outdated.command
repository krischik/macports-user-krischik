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
	"sitecopy"			\
	"antenna"			\
	"apache2"			\
	"docker"			\
	"ext4fuse"	    		\
	"fontforge"			\
	"ctags"				\
	"gcc6"				\
	"gcc8"				\
	"rsync"				\
	"gimp-app"			\
	"git"				\
	"git-crypt"			\
	"git-cvs"			\
	"git-extras"			\
	"git-flow"			\
	"git-flow-bash-completion"	\
	"git-lfs"			\
	"GitX"				\
	"llvm-3.7"			\
	"llvm-3.9"			\
	"macfuse"	    		\
	"maven31"			\
	"maven32"			\
	"maven_select"			\
	"maven3"			\
	"microemu"			\
	"openjdk11"			\
	"osxfuse"	    		\
	"python27"			\
	"scala2.11"			\
	"scala2.11-docs"		\
	"VeraCrypt"	    		\
	"yasm"
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
