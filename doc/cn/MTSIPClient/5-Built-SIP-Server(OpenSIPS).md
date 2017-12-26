> Webcome to project:[MTAVIPClient](https://www.github.com/MTMediaDev/MTAVIPClient); Expecting you to join!
> **MTAVIPClient** supports H323 and SIP protocols.   
> **MTAVIPClient** means Audio/Video over IP networkd.  

**SIPClient-5 Built SIP Server(OpenSIPS)**
## 1 OpenSIPS简介
[OpenSIPS](http://opensips.org/)是一个成熟的开源SIP服务器，除了提供基本的SIP代理及SIP路由功能外，还提供了一些应用级的功能。OpenSIPS的结构非常灵活，其核心路由功能完全通过脚本来实现，可灵活定制各种路由策略，可灵活应用于语音、视频通信、IM以及 Presence等多种应用。同时OpenSIPS性能上是目前最快的SIP服务器之一，可用于电信级产品构建。

[OpenSIPS](http://opensips.org/)被推荐用于任何种类的SIP场景/服务：
- 高吞吐量: 数以万计的CPS，数百万的同时通话(见官方测试)
- 路由和集成的灵活性: 用于实现自定义路由逻辑的路由脚本，多个接口API(参见手册)
- 有效的应用程序构建: 超过120个模块提供功能，SIP处理，后端操作，集成，路由逻辑

## 2 OpenSIPS的特性
OpenSIPS提供许多重要而有趣的特性。
- SIP registrar server
- SIP router / proxy (lcr, dynamic routing, dialplan features)
- SIP redirect server
- SIP presence agent
- SIP back-to-back User Agent
- SIP IM server (chat and end-2-end IM)
- SIP to SMS gateway (bidirectional)
- SIP to XMPP gateway for presence and IM (bidirectional)
- SIP load-balancer or dispatcher
- SIP front end for gateways/asterisk
- SIP NAT traversal unit
- SIP application server

## 2 OpenSIPS编译安装方法
从http://opensips.org/pub/opensips/下载最新版本源码。
移步到OpenSIPS的源码根目录，执行 **make all** 命令之后，OpenSIPS相关组件将被全部编译。

- OpenSIPS项目依赖bison or yacc(Berkley yacc)，编译方法：./configure，make，sudo make install
- OpenSIPS项目依赖flex，编译方法：./configure，make，sudo make install
- OpenSIPS项目依赖libncurses5-dev和m4

## 3 OpenSIPS的配置方法
OpenSIPS的配置文件都在/etc/opensips/中，分别为opensips.cfg、opensipsctlrc和osipsconsolerc。
opensips.cfg文件主要用于opensips启动的配置，所有应用功能的配置都在这个文件中说明。配置选项包括：全局变量，模块及参数和路由策略和功能应用等。

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