#STEP 1: download stable h323plus
wget http://www.h323plus.org/source/download/h323plus-v1_26_5.tar.gz
md5sum h323plus-v1_26_5.tar.gz

#STEP 2: release h323plus
tar -zxf h323plus-v1_26_5.tar.gz
cd h323plus-1.26/

#STEP 3: config and build
./configure
make; make install

