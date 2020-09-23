#!/bin/zsh
############################################################## {{{1 ##########
#   $Author$
#   $Revision$
#   $Date$
#   $HeadURL$
############################################################## }}}1 ##########

setopt Err_Exit;

typeset -r in_Version=${1}
typeset -r Repository="macports-user-krischik"
typeset -r Port="atari800"

typeset -x -g GITHUB_USER="krischik"

alias mv=/opt/local/bin/gmv
alias rm=/opt/local/bin/grm
alias cp=/opt/local/bin/gcp

pushd "/var/tmp"
    gcp --verbose --recursive "/Work/MacPorts/krischik/${Port}" "."

    pushd "${Port}"
	for I in "appbundles" "share"; do
	    mv --verbose ${I} ${I}-r${in_Version}

	    tar --verbose --create --gzip			\
		--file="${Port}-${I}-r${in_Version}.tar.gz"	\
		${I}-r${in_Version}

	    /usr/local/bin/github-release						    \
		--verbose						    		    \
		upload							    		    \
		--security-token    "${GitHub_Upload_Key}"		    		    \
		--description	    "Patch files for the atari800 MacPorts distribution"    \
		--user		    "${User}"						    \
		--repo  	    "${Repository}"			    		    \
		--tag		    "${Port}_${in_Version}"		    		    \
		--file		    "${Port}-${I}-r${in_Version}.tar.gz"    		    \
		--name		    "${Port}-${I}-r${in_Version}"
	done; unset I
    popd

    # rm --verbose --recursive "${Port}"
popd

############################################################ {{{1 ###########
# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
