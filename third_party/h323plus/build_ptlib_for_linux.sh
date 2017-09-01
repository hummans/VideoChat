#STEP 1: download stable ptlib
PTLIB_TAR=ptlib-2.12.8.tar.bz2
echo "STEP 1: Download http://www.h323plus.org/source/download/${PTLIB_TAR}"
if [ ! -f ${PTLIB_TAR} ]; then 
wget http://www.h323plus.org/source/download/${PTLIB_TAR}
fi
md5sum ${PTLIB_TAR}

#STEP 2: Release PTLib
echo "STEP 2: Release Software Package:${PTLIB_TAR}"
PTLIB_ROOT=ptlib-2.12.8
if [ ! -d ${PTLIB_ROOT} ]; then
tar -xjf ${PTLIB_TAR}
fi

#STEP 3: Config and Build
echo "STEP 3: Config and Build"
cd ${PTLIB_ROOT}
./configure --prefix=${PWD}/../../built_libs_linux/ptlib
make; make install
