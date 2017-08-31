TEP 1: Clone Source Files
VOIP_PWLIB_ROOT=voip-apal
GIT_PATH=git://git.code.sf.net/p/opalvoip/ptlib
echo "STEP 1: Clone ${GIT_PATH}"
if [ ! -d ${VOIP_PWLIB_ROOT} ]; then 
git clone ${GIT_PATH} ${VOIP_PWLIB_ROOT}
fi
cd ./${VOIP_PWLIB_ROOT}
git branch -a

#STEP 2: Config and Install
VOIP_PWLIB_LIB=libs
if [ ! -d ${VOIP_PWLIB_LIB} ]; then
echo "STEP 2: Autogen and Config ${VOIP_PWLIB_ROOT} First"
./autogen.sh
./configure
fi
make; make install
