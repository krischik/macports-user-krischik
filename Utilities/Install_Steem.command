#!/opt/local/bin/zsh
############################################################## {{{1 ##########
#   $Author: krischik@macports.org $
#   $Revision: 143895 $
#   $Date: 2015-12-25 08:11:12 +0100 (Fr, 25. Dez 2015) $
#   $HeadURL: http://svn.macports.org/repository/macports/users/krischik/Utilities/Install_Mobile_Development.command $
############################################################## }}}1 ##########

source ${0:h}/Setup.command

setopt No_XTrace
setopt Err_Exit

if test "${USER}" = "root"; then
    #Deselect_System
    ${0:h}/Install_Python.command

    # A python 3 is needed to compile
    #
    port select --set "python3" "python36"

    for I in				\
	"autoconf"			\
	"automake"			\
	"cryptlib"			\
	"boost"				\
	"git"				\
	"libtool"			\
	"openssl"			\
	"secpwgen"			\
        "berkeley-db"			\
        "gperftools"
    do
	Install_Update ${I} ${=General_Variants}
    done; unset I

    #Select_System
    #Clean
else
    setopt Multi_OS

    # brew install homebrew/versions/boost160
    
    sudo ${0:a} 1>&1 2>&2 &>~/Library/Logs/${0:r:t}.out

    # brew update
    # brew upgrade
    # brew install boost cmake git openssl autoconf automake qt5
    # brew link --force openssl
    # brew install google-perftools
    # brew install berkeley-db
    # brew install libtool
    # brew install python3

    # typeset -x -g BOOST_ROOT="/usr/local/Cellar/boost@1.60/1.60.0"
    # typeset -x -g BOOST_LIBRARYDIR="${BOOST_ROOT}/lib"
    # typeset -x -g BOOST_INCLUDEDIR="${BOOST_ROOT}/include"

    # git fetch --tags --force
    # git submodule update --init --recursive
    # git checkout tags/v0.19.2

    pushd "/Volumes/KINGSTON/Work/steemit"
	git clone https://github.com/steemit/steem

	pushd "steem"
	    git submodule update --init --recursive
	    cmake -DCMAKE_BUILD_TYPE=Release -DENABLE_CONTENT_PATCHING=OFF -DLOW_MEMORY_NODE=ON
	    make
	popd
    popd
fi

############################################################ {{{1 ###########
# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
