#STEP 1: Clone Source Files
VOIP_OPAL_ROOT=voip-apal
GIT_PATH=git://git.code.sf.net/p/opalvoip/opal
echo "STEP 1: Clone ${GIT_PATH}"
if [ ! -d ${VOIP_OPAL_ROOT} ]; then 
git clone ${GIT_PATH} ${VOIP_OPAL_ROOT}
fi
cd ./${VOIP_OPAL_ROOT}
git branch -a

#STEP 2: Config and Install
VOIP_OPAL_LIB=libs
if [ ! -d ${VOIP_OPAL_LIB} ]; then
echo "STEP 2: Autogen and Config ${VOIP_OPAL_ROOT} First"
./autogen.sh
./configure
fi
make; make install
