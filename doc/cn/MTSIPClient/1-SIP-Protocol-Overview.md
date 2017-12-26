> Webcome to project:[MTAVIPClient](https://www.github.com/MTMediaDev/MTAVIPClient); Expecting you to join!
> **MTAVIPClient** supports H323 and SIP protocols.   
> **MTAVIPClient** means Audio/Video over IP networkd.  

**SIPClient-1 SIP Protocol Overview** 
## 1 SIP协议族
国际互联网工程任务组(IETF)制定了SIP协议;SIP协议对标的是国际电信联盟(ITU-T)的H323协议族;SIP是一个轻量级信令协议，它可以作为音频、视频、及时信息的信令。ITEF奉行"rough consensus and running code",每年三次开放性论坛使其制定协议的周期非常短。

SIP协议家族使用的协议列表:
- **RFC 2821**: SMTP协议(Simple Mail Transfer Protocol);
- **RFC 2616**: HTTP协议(Hypertext Transfer Protocol);
- **RFC 3550**: RTP/RTCP协议(Real Time Transport Protocol/Real Time Control Protocol),定义了在IP网上的多媒体包格式;
- **RFC 2327**: SDP协议(Session Description Protocol ),定义了一个多媒体会话的参数和特征
- **RFC 2543**: SIP协议1.0;
- **RFC 3261**: SIP协议2.0.

## 2 SIP系统架构
SIP的架构采用典型的C-S架构。SIP赋能设备端点(called user agents)去发现另外的端点并建立多媒体会话。SIP赋能网络基础设备(called proxy servers)去处理用户代理的注册，会议邀请和其他请求。SIP是一个灵活的通用工具,该会话协议的创建，修改和终止独立于底层传输的。SIP系统包含的网络实体包括：客户端和服务器。

SIP User Agent --> SIP Request(RFC 3261) --> SIP Proxy Server --> SIP INVITE(RFC 3261) --> Another SIP User Agent  
SIP用户代理发送一个SIP Request。SIP Proxy Server接收SIP Request并且按照RFC3261的处理逻辑，将SIP INVITE转发给另外一个SIP用户代理，并将响应状态(FAIL/SUCCESS)反馈给SIP用户代理。

### 2.1 Client的主要角色：
**User Agent Client**: 用户代理客户端, SIP的设备端点,其向SIP网络中发送SIP请求和接收SIP应答。

### 2.2 Server的主要角色：
- **User Agent Server**: 用户代理服务器是一个逻辑实体对SIP请求做出应答。响应接受、拒绝或重定向请求。此角色仅在该事务的持续时间内执行。
- **Redirect Server**: 重定向服务器，将接收到的请求生成3xx响应，指示客户端连接到另一组uri。
- **Register Server**: 注册服务器用于接收注册请求，并将接收到的注册信息存储在服务器上。
- **Proxy Server**: 代理服务器是一个中间设备;它将用户代理客户端的网络请求,路由到用户代理服务器; 并接收服务器的应答，并路由到客户端。  

**需要注意的是：客户端和服务器的角色划分是逻辑上的划分，在物理上可能是同一实体。**

## 3 H323与SIP区别和联系
H323是由国际电信联盟电信标准局(ITU-T)颁发的一套标准，它定义了一套在分组交换网络中实现音频和视频通信的协议。SIP协议采用与HTTP类似的文本命令形式，而且协议比较简单，是未来网络电话和即时通讯的方向。两套协议的目标是一致的，下面从设计思想、系统功能和协议方面比较一下异同点。  
### 3.1 设计思想的比较
H.323标准是ITU-T组件在H.320/H.324的基础上建立的; H.323沿用的是传统的实现电话信令模式; 继承了通信领域传统的集中、层次控制设计思想，进行集中化和层次化控制。  
SIP标准是IETF在HTTP/SMTP的基础上建立的; IP标准的目标是:基于IP数据环境，实现数据、音视频实时通讯; 借鉴了因特网的标准和协议的设计思想，在风格上遵循因特网一贯坚持的简练、开放、兼容和可扩展等原则。

### 3.2 系统功能的比较
SIP的User Agent是一个逻辑实体，功能等同于H.323的Terninal实体, 实现呼叫的发起和接收，并完成所传输媒体的编解码应用
SIP的Agent Server, Redirect Server and Register Server实体功能类似于H.323的Gatekeeper实体, 实现了终端的注册、呼叫地址的解析以及路由。

### 3.3 协议层次的比较
IETF的SIP体系和ITU-T的H323体系中，媒体流均采用RTP协议，不同主要体现在呼叫信令和控制信令。
SIP协议的作用等同于H323系统中中的RAS和Q.931协议。
SIP协议中的SDP作用等同于H323系统中H.245。
多媒体传输和控制均采用RTP和RTCP协议。
H.323信令信息是符合ASN.1的二进制编码，需要特殊的编解码器。
SIP信息是基于文本的，采用ISO10646以UTF-8编码，易于编码实现和调试。

## 4 SIP的服务质量指标(QoS)
要提高SIP的QoS可以从终端和核心网两个方面出发。提高核心网的容量或使用有QoS保证的IP网络可以提高全局的QoS; 优化终端可以提高个体的QoS。
-  **端到端时延** 根据ITU-T组织建议使用G.144协议，端到端时延有如下规定:(1)0ms～150ms对于大多数应用可接受。(2)150ms～400ms对于有限的应用可接受。(3)400ms以上对于通常的网络应用不可接受。
- **时延抖动(Delay Jitter)** 一般是指语音流中两个连续的语音包的端到端时延的差值。
- **丢包率**
语音质量的评价通常用丢包率(R值)来衡量。丢包率(R值)有如下规定：(1)<5%，可接受。(2)<10%，通过提示丢包噪音可接受。丢包率计算公式: R = Ro-Is-Id-Ie+A。式中，Ro为基本信噪比，Is为同时损害因子，Id为延时带来的损害因子，Ie为设备带来的损害因子， A为有利因子。

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