#STEP 1: Install dependencies(Need Root Permissions)
apt-get install \
        build-essential flex bison autoconf automake pkg-config \
        libfreetype6-dev libjpeg62-dev libsofia-sip-ua-dev \
        libvpx-dev libx264-dev libav-tools libavcodec-dev \
        libavutil-dev libsamplerate0-dev libopus-dev

#STEOP 2: Clone Source Files
OPENMCU_RU_ROOT=openmcu-ru
if [ ! -d ${OPENMCU_RU_ROOT} ]; then 
git clone git://github.com/muggot/openmcu.git ${OPENMCU_RU_ROOT}
fi
cd ./${OPENMCU_RU_ROOT}
git branch -a

#STEP 3: Config and Install
OPENMCU_RU_BIN=/opt/openmcu-ru/bin/openmcu-ru
if [ ! -f ${OPENMCU_RU_BIN} ]; then
echo "Autogen and Config ${OPENMCU_RU_ROOT} First"
./autogen.sh
./configure --disable-g7221   #Fail to config and compile g722-1 audio plugin
echo "autogen and config"
fi
make; make install

#STEP 4: Run OpenMCU-ru
/opt/openmcu-ru/bin/openmcu-ru --help
/opt/openmcu-ru/bin/openmcu-ru -x -c
echo "browse: http://localhost:1420"
