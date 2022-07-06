#!/opt/local/bin/zsh
############################################################## {{{1 ##########
#   $Author: krischik@macports.org $
#   $Revision: 133186 $
#   $Date: 2015-02-23 14:59:43 +0100 (Mo, 23. Feb 2015) $
#   $HeadURL: http://svn.macports.org/repository/macports/users/krischik/Utilities/Update.command $
############################################################## }}}1 ##########

source ${0:a:h}/Setup.command

setopt No_XTrace
setopt No_Err_Exit

function Update_Ruby ()
{
    local in_Gem="${1}"
   
    if test -x "${in_Gem}"; then
	echo "Update Rupy installation ${1}"

	${in_Gem} uninstall google-api-client
	${in_Gem} update $(${in_Gem} list | cut -d ' ' -f 1)
	${in_Gem} cleanup
    fi
}

function Update_Node ()
{
    local in_NPM="${1}"
    
    if test -x "${in_NPM}"; then
	echo "Update Node installation ${in_NPM}"

	${in_NPM} update
    fi
}

function Update_Python ()
{
    local in_PIP="${1}"
    
    if test -x "${in_PIP}"; then
	echo "Update Perl installation ${in_PIP}"

	${in_PIP} list --outdated --format=freeze   | \
	    grep -v '^\-e'			    | \
	    cut -d = -f 1			    | \
	    xargs -n1 ${in_PIP} install -U
    fi
}

function Update_Perl ()
{
    local in_CPAN="${1}"
    
    if test -x "${in_CPAN}"; then
	echo "Update Perl installation ${in_CPAN}"

	${in_CPAN} -u
    fi
}

if test "${USER}" = "root"; then
    Unload_System

    port select --set gcc llvm-gcc6

    echo "===> Self Update"
    port selfupdate
    echo "===> Sync"
    port sync

    Update_Packages

    for I in "gem2.5" "gem2.6" "gem2.6" "gem2.7"; do
	Update_Ruby "/opt/local/bin/${I}"
    done; unset I

    Update_Node "/opt/local/bin/npm"

    Clean
    Load_System
else
    setopt Multi_OS

    Unload_User
    Update_Tree

    sudo ${0:a} 1>&1 2>&2 &>~/Library/Logs/${0:r:t}.out

    brew update
    brew upgrade

#   Update_Ruby	    "/usr/bin/gem"
#   Update_Python   "/usr/bin/pip3"
#   Update_Perl	    "/usr/bin/cpan"

    Update_Ruby	    "/usr/local/opt/ruby/bin/gem"
    Update_Node	    "/usr/local/opt/npm/bin/npm"
    Update_Perl	    "/usr/local/opt/perl/bin/cpan"

    for I in "pip2.7" "pip3.7" "pip3.8"; do
	Update_Python "/usr/local/bin/${I}"
    done; unset I
 
    Load_User
fi

############################################################ {{{1 ###########
# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
