> Webcome to project:[MTAVIPClient](https://www.github.com/MTMediaDev/MTAVIPClient); Expecting you to join!
> **MTAVIPClient** supports H323 and SIP protocols.   
> **MTAVIPClient** means Audio/Video over IP networkd.  

**SIPClient-6 SIP Create MTSIPClient using Open Source** 
## 1 SIP的主要协议
国际互联网工程任务组(IETF)制定了SIP协议,SIP是一个轻量级信令协议，它可以作为音频、视频、及时信息的信令。SIP协议家族使用的协议列表:
- RFC 2821: SMTP协议(Simple Mail Transfer - Protocol);
- RFC 2616: HTTP协议(Hypertext Transfer Protocol);
- RFC 3550: RTP/RTCP协议(Real Time Transport Protocol/Real Time Control Protocol),定义了在IP网上的多媒体包格式;
- RFC 2327: SDP协议(Session Description Protocol),定义了一个多媒体会话的参数和特征
- RFC 2543: SIP协议1.0;
- RFC 3261: SIP协议2.0.
- RFC 4629 RTP Payload Format for ITU-T Rec. H.263 Video 
- RFC 6184 RTP Payload Format for H.264 Video 
- RFC 5109 RTP Payload Format for Generic Forward Error Correction

## 2 MTSIPClient的开源库选型
- **Sofia-Sip** is SIP stack implementation with STUN and presense support
- **reSIProcate** The reSIProcate project is part of the SIPfoundry community. The project aims at building a freely available, completely standards based and complete reference implementation of a SIP stack including an easy to use application layer API. The reSIProcate stack is currently used in several commercial products and is very stable.
- Evaluating... Draft...

### 2.1 SIP协议栈开源库的选型
H323Plus项目：该项目实现了H323协议族，为基于IP网络的多媒体通信奠定了坚实基础，还扩展了323功能，增加了NAT / FW穿越解决方案。H323Plus(V1.26.8)项目依赖PTLib(V2.12.8)项目。
项目地址：https://github.com/willamowius/h323plus
API文档：https://www.h323plus.org/api/v1_26_0/index.html

### 2.2 SIP服务器选型
OpenSIPS是用于语音，视频，即时消息，任何其他SIP扩展的开放源代码SIP代理/服务器。OpenSIPS是一种多功能，多用途的信令SIP服务器，被运营商和电信服务商广泛应用于PBX解决方案，会话边界控制器，应用服务器，前端负载平衡机，IMS平台，呼叫中心等等。

## 3 MTSIPClient的设计
Coming soon...

## 4 MTSIPClient的编译
Coming soon...

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