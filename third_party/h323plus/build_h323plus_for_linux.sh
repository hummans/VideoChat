H323PLUS_ROOT=h323plus
H323PLUS_TAR=h323plus-v1_26_5.tar.gz

#STEP 1: download stable h323plus
echo "STEP 1: Download h323plus.org/source/download/${H323PLUS_TAR}"
if [ ! -f ${H323PLUS_TAR} ]; then 
wget http://www.h323plus.org/source/download/${H323PLUS_TAR}
md5sum ${H323PLUS_TAR}
fi

#STEP 2: Release h323plus
echo "STEP 2: Release H323plus Package"
if [ ! -d ${H323PLUS_ROOT} ]; then 
tar -zxf ${H323PLUS_TAR}
mv h323plus-1.26 ${H323PLUS_ROOT}
fi

#STEP 3: config and build
echo "STEP 3: Config and Build ${H323PLUS_ROOT}"
cd ${H323PLUS_ROOT}
export PTLIB_CFLAGS=' -DP_64BIT -DPTRACING=2 -D_REENTRANT -fno-exceptions '
export PTLIBDIR=${PWD}/../ptlib
#export PTLIB_LIBS=${PWD}/../../built_libs_linux/ptlib
export PKG_CONFIG_PATH=${PWD}/../../built_libs_linux/ptlib/lib/pkgconfig
#inport PTLib Path(ld libpt.so) for H323plus
export LIBRARY_PATH=${PWD}/../../built_libs_linux/ptlib/lib
./configure --prefix=${PWD}/../../built_libs_linux/h323plus
make -j16;
make install

echo "Have a look to ptlib and h323plus"
ls -al ${PWD}/../../built_libs_linux/ptlib
ls -al ${PWD}/../../built_libs_linux/h323plus
