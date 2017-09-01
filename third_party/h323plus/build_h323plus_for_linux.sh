#STEP 1: download stable h323plus
H323PLUS_TAR=h323plus-v1_26_5.tar.gz
echo "STEP 1: Download h323plus.org/source/download/${H323PLUS_TAR}"
if [ ! -f ${H323PLUS_TAR} ]; then 
wget http://www.h323plus.org/source/download/${H323PLUS_TAR}
md5sum ${H323PLUS_TAR}
#STEP 2: release h323plus
tar -zxf ${H323PLUS_TAR}
fi

#STEP 2: Release h323plus
H323PLUS_ROOT=h323plus-1.26
echo "STEP 2: Release H323plus Package"
if [ ! -d ${H323PLUS_TAR} ]; then 
tar -zxf ${H323PLUS_TAR}
fi

#STEP 3: config and build
echo "STEP 3: Config and Build ${H323PLUS_ROOT}"
cd ${H323PLUS_ROOT}
ls -al ${PWD}/../../built_libs_linux/ptlib/share/ptlib/make
export PTLIB_CFLAGS=' -DP_64BIT -DPTRACING=2 -D_REENTRANT -fno-exceptions '
export PKG_CONFIG_PATH=${PWD}/../../built_libs_linux/ptlib/lib/pkgconfig
export PTLIBDIR=${PWD}/../../built_libs_linux/ptlib/share/ptlib
echo ${PT_LIBDIR}
./configure
make; make install

