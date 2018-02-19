#!/opt/local/bin/zsh
############################################################## {{{1 ##########
#   $Author: krischik@macports.org $
#   $Revision: 143895 $
#   $Date: 2015-12-25 08:11:12 +0100 (Fr, 25. Dez 2015) $
#   $HeadURL: http://svn.macports.org/repository/macports/users/krischik/Utilities/Install_Mobile_Development.command $
############################################################## }}}1 ##########

source ${0:h}/Setup.command

setopt No_XTrace
setopt No_Err_Exit

if test "${USER}" = "root"; then
    for I in						\
	"cargo"						\
	"rust"
    do
	Install_Update ${=I} "${=General_Variants}"
    done; unset I
else
    setopt Multi_OS

    sudo ${0:a} 1>&1 2>&2 &>~/Library/Logs/${0:r:t}.out

    brew update
    brew upgrade
    brew tap ethereum/ethereum
    brew install solidity
    brew linkapps solidity

    cd parity

    # build in release mode
    cargo build --release
#	https://github.com/weidai11/cryptopp/archive/CRYPTOPP_5_6_5.tar.gz
    popd
fi

############################################################ {{{1 ###########
# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
