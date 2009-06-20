#!/bin/zsh
############################################################## {{{1 ##########
#   $Author: krischik@macports.org $
#   $Revision: 47826 $
#   $Date: 2009-03-07 14:16:20 +0100 (Sa, 07 Mär 2009) $
#   $HeadURL: http://svn.macports.org/repository/macports/users/krischik/nonpareil/Upload.command $
############################################################## }}}1 ##########

setopt Err_Exit;

typeset -r in_Version=${1}
typeset -r Repository=http://svn.macports.org/repository/macports
typeset -r User=krischik
typeset -r Port=atari800

#alias tar=/opt/local/bin/gnutar
alias mv=/opt/local/bin/gmv
alias rm=/opt/local/bin/grm

pushd "/var/tmp"
    svn export ${Repository}/users/${User}/${Port}
    pushd "${Port}"
	for I in "appbundles"; do
	    mv --verbose ${I} ${I}-r${in_Version}
	    tar --create --gzip								\
		--file="${Port}-${I}-r${in_Version}.tar.gz"				\
		${I}-r${in_Version}
	    svn import									\
		-m"Add distfile for ${Port}"						\
		"${Port}-${I}-r${in_Version}.tar.gz"					\
		"${Repository}/distfiles/${Port}/${Port}-${I}-r${in_Version}.tar.gz"	;
	done; unset I
    popd;
    rm --verbose --recursive "${Port}"
popd;

############################################################ {{{1 ###########
# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
