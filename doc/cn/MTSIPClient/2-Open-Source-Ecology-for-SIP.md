> Webcome to project:[MTAVIPClient](https://www.github.com/MTMediaDev/MTAVIPClient); Expecting you to join!
> **MTAVIPClient** supports H323 and SIP protocols.   
> **MTAVIPClient** means Audio/Video over IP networkd.  

**SIPClient-2 Open Source Ecology for SIP**  
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

## 2 开源SIP协议栈
- **Sofia-Sip** is SIP stack implementation with STUN and presense support  
- **SIP SIMPLE client SDK** - High level middleware on top of SIP, RTP, MSRP and XCAP protocols  
- **reSIProcate** The reSIProcate project is part of the SIPfoundry community. The project aims at building a freely available, completely standards based and complete reference implementation of a SIP stack including an easy to use application layer API. The reSIProcate stack is currently used in several commercial products and is very stable.
- **ccRTP** C++ library based on GNU Common C++
- **JRTPLIB** C++ object oriented RTP library  

## 3 开源SIP网关
[OpenSIPS](http://opensips.org/)是用于语音，视频，即时消息，任何其他SIP扩展的开放源代码SIP代理/服务器。

[OpenSIPS](http://opensips.org/)是一种多功能，多用途的信令SIP服务器，被运营商和电信服务商广泛应用于PBX解决方案，会话边界控制器，应用服务器，前端负载平衡机，IMS平台，呼叫中心等等

[OpenSIPS](http://opensips.org/)被推荐用于任何种类的SIP场景/服务：
- 高吞吐量: 数以万计的CPS，数百万的同时通话(见官方测试)
- 路由和集成的灵活性: 用于实现自定义路由逻辑的路由脚本，多个接口API(参见手册)
- 有效的应用程序构建: 超过120个模块提供功能，SIP处理，后端操作，集成，路由逻辑

思科和华为拥有全功能的SIP的商业Gateway产品线。

## 4 其他开源项目
在视频会议领域拥有大量的开源项目，这些开源项目有些聚焦于完整的视频会议生态，有些聚焦于在视频会议控制协议，有些聚焦于流媒体传输，有些聚焦于音视频编解码。适当使用合理参考，能够提升我们的开发效率。

| 项目名称 | 项目地址 | 项目定位 |
| :--- | :--- | :--- |
| H323Plus | [http://www.h323plus.org](http://www.h323plus.org) | 全功能的H.323协议 |
| ffmepg  | [http://ffmpeg.org](http://ffmpeg.org) | 全功能的开源视频编辑器 |
| OpenMeeting | [http://code.google.com/p/openmeetings](http://code.google.com/p/openmeetings) | java视频会议首选 |
| webrtc | [http://www.webrtc.org](http://www.webrtc.org)   | 基于浏览器的实时通信开源项目 |
| live555 | [http://www.live555.com/](http://www.live555.com/)   | 流媒体开源项目 |
| OPAL | [http://sourceforge.net/projects/opalvoip](http://sourceforge.net/projects/opalvoip)     | 实现SIP协议的首选 |
| x264 | [http://www.x264.nl/](http://www.x264.nl/) | 应用最广的H.264编码器 |
| Speex | [http://www.speex.org](http://www.speex.org) | 音频领域最著名的开源项目 |
| JRTPLIB | [https://github.com/j0r1/JRTPLIB](https://github.com/j0r1/JRTPLIB) | C++跨平台的 RTP传输开源项目 |
| EMIPLIB | [https://github.com/j0r1/EMIPLIB](https://github.com/j0r1/EMIPLIB) | EDM Media over IP library(大学研究项目) |
| xvid | [http://www.xvid.org](http://www.xvid.org) | MPEG4编码器开源项目 |

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