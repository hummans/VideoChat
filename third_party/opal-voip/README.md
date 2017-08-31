### 1: PTLib  Description
API documentation: http://files.opalvoip.org/docs/ptlib-v2_14/

PTLib is a moderately large C++ class library that aims at highly portable network-centric cross-platform library.The development of the OpenH323 and OPAL projects as primary user of the library, has emphasised the focus on networking, I/O portability, multi-threading and protocol portability, but it is definitely useful as a stand-alone library to anyone that wishes to write portable applications.

The classes within PTLib are seperated into two types: Base Classes and Console Components The Base Classes contain all of the essential support for constructs such as containers, threads and sockets that are dependent on platform specific features. All PTLib programs will require the Base Classes. The Console Components implement functionality that is usually platform independent, and may not be required for all programs.

You can clone ptlib_v2.16  use git. 
opal$ git clone git://git.code.sf.net/p/opalvoip/ptlib

### 2: OPAL Description
API documentation: http://files.opalvoip.org/docs/opal-v3_14/

OPAL a Open Source class library for the development of applications that wish to use the SIP and H.323 protocols for multi-media communications over packet based networks.Which is your typical layered approach to a system. The application layer is presented with a unified model for making calls over whatever underlying protocol or hardware by the so the calls can be placed and media flow handled in, as much as possible, an identical manner.

LayerName | ClassName
------------ | -------------
OPAL-api | OpalManager/OpalEndPoint/OpalCall/OpalConnection/OpalMediaFormat
OPAL-api | OpalMediaStream/OpalTranscoder/OpalListener/OpalTransport
EndPoints | H323EndPoint/SIPEndPoint/OpalRTPEndPoint
I/O | RTP/Packets Audio/Video Camera

You can clone opal_v3.16  use git.
opal$ git clone git://git.code.sf.net/p/opalvoip/opal

More Details for OPAL-Project
- [x] http://wiki.opalvoip.org/
- [x] http://wiki.opalvoip.org/index.php?n=Main.BuildingPTLibUnix
- [x] http://wiki.opalvoip.org/index.php?n=Main.BuildingOpalUnix
- [x] git://git.code.sf.net/p/opalvoip/ptlib
- [x] git://git.code.sf.net/p/opalvoip/opal

### 3 Todo List
- [x] TODO.....


### 4 Build and Install
- [x] Read build scripts for third_party/opal/build_pwlib_2.x.sh
- [x] Read build scripts for third_party/opal/build_opal_v3.x.sh
