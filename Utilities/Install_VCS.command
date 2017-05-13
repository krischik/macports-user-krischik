#!/opt/local/bin/zsh
############################################################## {{{1 ##########
#   $Author: krischik@macports.org $
#   $Revision: 143895 $
#   $Date: 2015-12-25 08:11:12 +0100 (Fr, 25. Dez 2015) $
#   $HeadURL: http://svn.macports.org/repository/macports/users/krischik/Utilities/Install_VCS.command $
############################################################## }}}1 ##########

source ${0:h}/Setup.command

setopt No_XTrace
setopt No_Err_Exit

if test "${USER}" = "root"; then
    Deselect_System
    Update_Tree
    Update_Packages

    for I in								\
	"openssh"							\
	"sshpass"							\
	"cvs +gssapi+proxy"						\
	"git +credential_osxkeychain+doc+svn"		\
	"git-extras"							\
	"git-cvs"							\
	"GitX"								\
	"juni"								\
	"subversion +bash_completion+tools+mod_dav_svn+unicode_path"	\
	"cvs2svn"							\
	"subversion-javahlbindings"
    do
	Install_Update ${I} "${=General_Variants}"
    done; unset I

    Select_System
    Clean
else
    setopt Multi_OS
    sudo ${0:a} 1>&1 2>&2 &>~/Library/Logs/${0:r:t}.out
fi

############################################################ {{{1 ###########
# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
