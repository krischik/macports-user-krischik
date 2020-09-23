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
typeset -r Tag="${Port}-${in_Version}"
typeset -r Work="/Work/MacPorts/krischik"

typeset -x -g GITHUB_USER="krischik"

alias mv=/opt/local/bin/gmv
alias rm=/opt/local/bin/grm
alias cp=/opt/local/bin/gcp

git add "${Work}"
git commit --message="Commit for release ${Tag}"
git push

/usr/local/bin/github-release							\
    release									\
    --security-token	"${GitHub_Upload_Key}"					\
    --user		    "${GITHUB_USER}"					\
    --repo		    "${Repository}"					\
    --tag		    "${Tag}"						\
    --name		    "${Port}-r${in_Version}"				\
    --description	    "Patch files for atari800 MacPorts distribution"	\
    --pre-release

pushd "/var/tmp"
    cp --verbose --recursive "${Work}/${Port}" "."
    rm --verbose --recursive **/.backups

    pushd "${Port}"
	for I in "appbundles" "share"; do
	    mv --verbose ${I} ${I}-r${in_Version}

	    tar --verbose --create --gzip					\
		--file="${Port}-${I}-r${in_Version}.tar.gz"			\
		${I}-r${in_Version}

	    /usr/local/bin/github-release					\
		upload								\
		--security-token    "${GitHub_Upload_Key}"			\
		--user		    "${GITHUB_USER}"				\
		--repo		    "${Repository}"				\
		--tag		    "${Tag}"					\
		--file		    "${Port}-${I}-r${in_Version}.tar.gz"	\
		--name		    "${Port}-${I}-r${in_Version}"
	done; unset I
    popd

    rm --verbose --recursive "${Port}"
popd

git pull --tags

############################################################ {{{1 ###########
# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
