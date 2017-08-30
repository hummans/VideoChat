#STEP 1: Install dependencies
apt-get install \
        build-essential flex bison autoconf automake pkg-config \
        libfreetype6-dev libjpeg62-dev libsofia-sip-ua-dev \
        libvpx-dev libx264-dev libav-tools libavcodec-dev \
        libavutil-dev libsamplerate0-dev libopus-dev

#STEOP 2: Clone Source Codes
git clone git://github.com/muggot/openmcu.git ./openmcu-ru-4.x
cd ./openmcu-ru-4.x

#STEP 3: Config and Install
./autogen.sh
./configure --disable-g7221   #Fail to config and compile g722-1 audio plugin
make; make install

#STEP 4: Run OpenMCU-ru
/opt/openmcu-ru/bin/openmcu-ru --help
/opt/openmcu-ru/bin/openmcu-ru -x -c
echo "browse: http://localhost:1420"
