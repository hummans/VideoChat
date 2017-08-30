#STEP 1: download stable ptlib
wget http://www.h323plus.org/source/download/ptlib-2.12.8.tar.bz2
md5sum ptlib-2.12.8.tar.bz2

#STEP 2: Release PTLib
tar -xjf ptlib-2.12.8.tar.bz2
cd ptlib-2.12.8/

#STEP 3: Config and Build
./configure
make; make install
