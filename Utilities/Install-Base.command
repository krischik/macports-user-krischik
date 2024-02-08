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
	"dos2unix"								\
	"enchant"								\
	"file +with_text_magic_file"						\
	"Filezilla"								\
	"findutils"								\
	"flex"									\
	"fontconfig +vera"							\
	"giflib"								\
	"gmp"									\
	"gnutar"								\
	"gwhich"								\
	"gzip +rsyncable"							\
	"hunspell"								\
	"hunspell-dict-de_DE"							\
	"ImageMagick +graphviz+gs+hdri+jbig+jpeg2+lcms+lqr+mpeg+perl+rsvg+wmf"  \
	"jasper +jiv"								\
	"jpeg"									\
	"libpng"								\
	"mdf2iso"								\
	"mmv"									\
	"mpfr"									\
	"nrg2iso"								\
	"ntfs-3g"								\
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
	"avahi +mono"								\
	"fugu"
	"zsh +doc+mp_completion"						\
    do
	Install_Update ${=I} "${General_Variants}"
    done; unset I

    port -f deactivate cryptlib

    Install_Update						    \
	"ImageMagick"						    \
	"+graphviz+gs+hdri+jbig+jpeg2+lcms+lqr+mpeg+perl+rsvg+wmf"  \
	"${General_Variants}"

    port activate cryptlib

    mkdir "/opt/local/share/clamav"

    chown _clamav:_clamav "/opt/local/share/clamav"
    chmod ugo+rwx	  "/opt/local/var/log"

    pushd "/opt/local/etc"
	cp "/opt/local/etc/freshclam.conf.sample" "/opt/local/etc/freshclam.conf"
    popd

    Select_System
    Clean
else
    setopt Multi_OS

    sudo ${0:a} 1>&1 2>&2 &>~/Library/Logs/${0:r:t}.out

    brew install	\
	"coreutils"	\
	"diffutils"	\
	"exiftool"	\
	"gnu-sed"	\
	"macfuse"	\
	"par2"		\
	"trash"		\
	"veracrypt"

    brew install	\
	--cask "fugu"
fi

############################################################ {{{1 ###########
# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
