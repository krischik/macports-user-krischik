#!/opt/local/bin/zsh

setopt Err_Exit
setopt X_Trace;

if test "${USER}" = "root"; then
    typeset prefix='/opt/local'
    typeset bootprefix='/opt/gnat-2012-x86_64-apple-darwin10.8.0-bin'
    typeset name=gnat
    typeset major=4.8

    #typeset -x -g AR_FOR_TARGET="/usr/bin/ar"
    #typeset -x -g AS_FOR_TARGET="/usr/bin/as"
    #typeset -x -g LD_FOR_TARGET="/usr/bin/ld"
    #typeset -x -g NM_FOR_TARGET="/usr/bin/nm"
    #typeset -x -g OBJDUMP_FOR_TARGET="/usr/bin/objdump"
    #typeset -x -g RANLIB_FOR_TARGET="/usr/bin/ranlib"
    #typeset -x -g STRIP_FOR_TARGET="/usr/bin/strip"

    typeset -x -g AR_FOR_TARGET="${prefix}/bin/ar"
    typeset -x -g AS_FOR_TARGET="${prefix}/bin/as"
    typeset -x -g LD_FOR_TARGET="${prefix}/bin/ld"
    typeset -x -g NM_FOR_TARGET="${prefix}/bin/nm"
    typeset -x -g OBJDUMP_FOR_TARGET="${prefix}/bin/objdump"
    typeset -x -g RANLIB_FOR_TARGET="${prefix}/bin/ranlib"
    typeset -x -g STRIP_FOR_TARGET="${prefix}/bin/strip"

    typeset -x -g CC="${bootprefix}/bin/gcc";
    typeset -x -g CPP="${bootprefix}/bin/cpp";
    typeset -x -g CXX="${bootprefix}/bin/g++";
    typeset -x -g CXXCPP="${bootprefix}/bin/cpp";
    typeset -x -g GNATBIND="${bootprefix}/bin/gnatbind";
    typeset -x -g GNATMAKE="${bootprefix}/bin/gnatmake";
    typeset -x -g OBJC="${bootprefix}/bin/gcc";

    #typeset -x -g CPPFLAGS="-I${bootprefix}/include -I${prefix}/include";
    #typeset -x -g LDFLAGS="-L${bootprefix}/lib -L${prefix}/lib";

    #typeset -x -g CFLAGS="-O2";
    #typeset -x -g CXXFLAGS="-O2";
    #typeset -x -g F90FLAGS="-O2 -m64";
    #typeset -x -g FCFLAGS="-O2 -m64";
    #typeset -x -g FFLAGS="-O2 -m64";
    #typeset -x -g INSTALL="/usr/bin/install -c";
    #typeset -x -g MACOSX_DEPLOYMENT_TARGET="10.7";
    #typeset -x -g OBJCFLAGS="-O2";

    typeset -x -g PATH="${bootprefix}/bin:${prefix}/bin:${prefix}/sbin:/bin:/sbin:/usr/bin:/usr/sbin"

    pushd "work/build";
	grm --verbose **/config.cache || true;
	gnice ../gcc-${major}-20120708/configure \
	    --enable-languages=c,c++,ada,objc,obj-c++,java,fortran \
            --libdir=${prefix}/lib/${name} \
            --includedir=${prefix}/include/${name} \
            --infodir=${prefix}/share/info \
            --mandir=${prefix}/share/man \
            --datarootdir=${prefix}/share/gcc-${major} \
            --with-libiconv-prefix=${prefix} \
            --with-local-prefix=${prefix} \
            --with-system-zlib \
            --disable-nls \
            --program-suffix=-gnat-${major} \
            --with-gxx-include-dir=${prefix}/include/${name}/c++/ \
            --with-gmp=${prefix} \
            --with-mpfr=${prefix} \
            --with-mpc=${prefix} \
            --with-ppl=${prefix} \
            --with-cloog=${prefix} \
	    --enable-cloog-backend=isl \
            --enable-stage1-checking \
            --disable-multilib \
            --enable-lto \
            --with-as=${prefix}/bin/as \
            --with-ld=${prefix}/bin/ld \
            --with-ar=${prefix}/bin/ar \
            --with-bugurl=https://trac.macports.org/newticket
	gnice make
    popd;
else
    setopt Multi_OS;

    sudo ${0:a} 1>&1 2>&2 &>~/Library/Logs/${0:r:t}.out;
fi;


# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
