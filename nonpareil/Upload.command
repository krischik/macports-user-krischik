#!/bin/zsh
############################################################## {{{1 ##########
#   $Author: krischik@macports.org $
#   $Revision: 47817 $
#   $Date: 2009-03-07 11:23:54 +0100 (Sa, 07 Mär 2009) $
#   $HeadURL: http://svn.macports.org/repository/macports/users/krischik/nonpareil/appbundles/HP-41CX.app/Contents/MacOS/HP-41CX.command $
############################################################## }}}1 ##########

setopt Err_Exit;

typeset -r in_Version=${1}
typeset -r Repository=http://svn.macports.org/repository/macports
typeset -r User=krischik
typeset -r Port=nonpareil

alias tar=/opt/local/bin/gnutar
alias mv=/opt/local/bin/gmv
alias rm=/opt/local/bin/grm

pushd "/var/tmp"
    svn export ${Repository}/users/${User}/${Port}
    pushd "${Port}"
	for I in "voyager" "appbundles"; do
	    mv --verbose ${I} ${I}-r${in_Version}
	    tar --create --gzip				    \
		--file="${Port}-${I}-r${in_Version}.tar.gz" \
		${I}-r${in_Version}
	    svn import					    \
		-m"Add distfile for ${Port}"		    \
		"${Port}-${I}-r${in_Version}.tar.gz"	    \
		"${Repository}/distfiles/${Port}/"	    ;
	done; unset I
    popd;
    echo rm --verbose --recursive "${Port}"
popd;

############################################################ {{{1 ###########
# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
