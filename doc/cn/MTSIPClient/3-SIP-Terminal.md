> Webcome to project:[MTAVIPClient](https://www.github.com/MTMediaDev/MTAVIPClient); Expecting you to join!
> **MTAVIPClient** supports H323 and SIP protocols.   
> **MTAVIPClient** means Audio/Video over IP networkd.  

**SIPClient-3 SIP Terminal** 
## 1 SIP的主要协议
国际互联网工程任务组(IETF)制定了SIP协议,SIP是一个轻量级信令协议，它可以作为音频、视频、及时信息的信令。SIP协议家族使用的协议列表:
- RFC 2821: SMTP协议(Simple Mail Transfer - Protocol);
- RFC 2616: HTTP协议(Hypertext Transfer Protocol);
- RFC 3550: RTP/RTCP协议(Real Time Transport Protocol/Real Time Control Protocol),定义了在IP网上的多媒体包格式;
- RFC 2327: SDP协议(Session Description Protocol ),定义了一个多媒体会话的参数和特征
- RFC 2543: SIP协议1.0;
- RFC 3261: SIP协议2.0.
- RFC 4629 RTP Payload Format for ITU-T Rec. H.263 Video 
- RFC 6184 RTP Payload Format for H.264 Video 
- RFC 5109 RTP Payload Format for Generic Forward Error Correction

## 2 SIP终端具有的特性
- [ ] Impliment SIP/SDP Protocals
- [ ] Impliment RTP/RTCP Protocals
- [ ] Video/Audio Encoding
- [ ] Video/Audio decoding
- [ ] MTSIPClient Testing with SIPServer

## 3 SIP终端的协议模型
SIP协议是以IP为网络中进行音视频通信的技术，呼叫的建立、拆除、控制、附加服务和能力交换等由控制信令SIP/SDP协议来实现。音视频数据通信由RTP承载，音视频数据控制有RTSP承载。音视频数据通信的基本原理是通过音视频压缩算法对音视频数据进行压缩编码处理，然后把这些压缩后的数据按照IP等相关协议进行打包，通过IP网络把数据包分组传输到目的地，再把这些包组合起来，经过解码解压处理后，恢复成原来的音视频信号。  
![image-1 SIP协议栈](/doc/images/mt_sip_device_protocal.png)

## 4 SIP终端的设备模型
SIP终端的输入端包括: 视频图像输入(设备显示图像或摄像头图像); 终端麦克风的音频输入；用户的数据传送等输入；用户UI控制输入等;网络数据输入。

SIP终端的输出端包括：视频解码显示输出；音频解码输出；网络数据输出等。

SIP协议和相关输入输出关系如下图所示。  
![image-2 SIP设备的通用模型](/doc/images/mt_sip_device_arch.png)

## 5 SIP网络的拓扑。
![image-3 User Agents connect to same Agent Server](/doc/images/mt_sip_net_lite.png)  
![image-4 User Agents connect to different Agent Server](/doc/images/mt_sip_net_full.png)  

## 参考文献
- [SIP: Session Initiation Protocol](https://tools.ietf.org/html/rfc3261)
- [SDP: Session Description Protocol](https://tools.ietf.org/html/rfc4566)
- [RTP: A Transport Protocol for Real-Time Applications](https://tools.ietf.org/html/rfc3550)
- [OpenSIPS: new breed of communication engine](http://opensips.org/)

**关于MTAVIPClient.git项目(子模块MTSIPClient)**
- [SIPClient-1 SIP Protocol Overview](/doc/cn/MTSIPClient/1-SIP-Protocol-Overview.md)
- [SIPClient-2 Open Source Ecology for SIP](/doc/cn/MTSIPClient/2-Open-Source-Ecology-for-SIP.md)
- [SIPClient-3 SIP Terminal](/doc/cn/MTSIPClient/3-SIP-Terminal.md)
- [SIPClient-4 SIP Workflow for Call Signal](/doc/cn/MTSIPClient/4-SIP-Workflow-for-Call-Signal.md)
- [SIPClient-5 Built SIP Server(OpenSIPS)](/doc/cn/MTSIPClient/5-Built-SIP-Server(OpenSIPS).md)
- [SIPClient-6 SIP Create MTSIPClient using Open Source](/doc/cn/MTSIPClient/6-SIP-Create-MTSIPClient-using-Open-Source.md)
- [SIPClient-7 Todo List for MTSIPClient](/doc/cn/MTSIPClient/7-Todo-List-for-MTSIPClient.md)