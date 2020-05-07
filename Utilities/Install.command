#!/opt/local/bin/zsh
############################################################## {{{1 ##########
#   $Author: krischik@macports.org $
#   $Revision: 143895 $
#   $Date: 2015-12-25 08:11:12 +0100 (Fr, 25. Dez 2015) $
#   $HeadURL: http://svn.macports.org/repository/macports/users/krischik/Utilities/Install.command $
############################################################## }}}1 ##########

source ${0:h}/Setup.command

setopt No_XTrace
setopt No_Err_Exit

if test "${USER}" = "root"; then
    Deselect_System
    Update_Tree
    Update_Packages

    for I in									\
	"aspell +nls"								\
	"aspell-dict-de"							\
	"aspell-dict-en"							\
	"aspell-dict-ru"							\
	"b5i2iso"								\
	"bison +yacc"								\
	"bitstream-vera"							\
	"bzip2"									\
	"clamav +clamav_milter"							\
	"coreutils"								\
	"curl-ca-bundle"							\
	"dbacl"									\
	"dbus"									\
	"diffutils"								\
	"docker"								\
	"dos2unix"								\
	"enchant"								\
	"file +with_text_magic_file"						\
	"findutils"								\
	"flex"									\
	"fontconfig +vera"							\
	"fontforge +freetype_bytecode"						\
	"giflib"								\
	"gmp"									\
	"gnutar"								\
	"gsed"									\
	"gwhich"								\
	"gzip +rsyncable"							\
	"hunspell"								\
	"hunspell-dict-de_DE"							\
	"jasper +jiv"								\
	"jpeg"									\
	"libpng"								\
	"mdf2iso"								\
	"mmv"									\
	"mpfr"									\
	"nrg2iso"								\
	"openldap"								\
	"p7zip"									\
	"par2"									\
	"pdi2iso"								\
	"png2ico"								\
	"readline"								\
	"rsync +rsyncd"								\
	"shared-mime-info"							\
	"sitecopy"								\
	"slocate"								\
	"spellutils"								\
	"sshpass"								\
	"star"									\
	"texinfo"								\
	"tiff"									\
	"uif2iso"								\
	"unison +aqua"								\
	"urw-fonts"								\
	"wget +ssl"								\
	"wput +ssl"								\
	"xpm"									\
	"xz"									\
	"yencode"								\
	"zsh +doc+mp_completion"						\
	"FileZilla"								\
	"ImageMagick +graphviz+gs+hdri+jbig+jpeg2+lcms+lqr+mpeg+perl+rsvg+wmf"
    do
	Install_Update ${=I} "${General_Variants}"
    done; unset I

    sudo port -f deactivate cryptlib

    Install_Update						    \
	"ImageMagick"						    \
	"+graphviz+gs+hdri+jbig+jpeg2+lcms+lqr+mpeg+perl+rsvg+wmf"  \
	"${General_Variants}"

    sudo port activate cryptlib

    # Ports without a universal variant

    for I in									\
	"osxfuse"								\
	"ext4fuse"								\
	"avahi +mono"								\
	"fugu"
    do
	Install_Update ${=I}
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
