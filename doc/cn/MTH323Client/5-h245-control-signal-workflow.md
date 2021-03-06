# H245 Workflow for Control Signal

> Webcome to project:[MTAVIPClient](https://www.github.com/MTMediaDev/MTAVIPClient); Expecting you to join!
> **MTAVIPClient** supports H323 and SIP protocols.   
> **MTAVIPClient** means Audio/Video over IP networkd.  

## 1 H245控制信令
H.245控制功能使用H.245控制信道来传送端到端控制消息,来管理H.323实体的运作，包括能力交换，开放和关闭逻辑信道，模式偏好请求，流量控制消息和一般命令等。H.245建议规定了许多支持端到端的独立协议实体信号。协议实体由其语法（消息），语义和一组指定指定消息交换和与用户交互的过程。 H.245消息分为四类：请求，响应，命令和指示。H.323终端应支持以下H.245协议实体的语法，语义和过程：
- Master/slave determination. H.245主从确定模块用于解决两个端点试图打开一个双向通道时可能存在的冲突。在这个过程中，两个端点随机交换号码在H.245 masterSlaveDetermination消息中，确定主从端点。 H.323端点应能够在主模式和从模式下运行。  
- Capability Exchange. 规定进行单独的接收和发送能力，终端可随时重新发布能力集。  
- Logical Channel Signalling. 每个逻辑信道能将来自发射机的信息发送到一个或多个接收机，并且是由每个传输方向唯一的逻辑信道号标识。逻辑通道使用openLogicalChannel和closeLogicalChannel消息打开和  关闭。  
- Bidirectional Logical Channel Signalling.  
- Close Logical Channel Signalling.  
- Mode Request. 接收机可以请求发射机使用H.245 requestMode消息发送特定模式。  
- Round Trip Delay Determination.  
- Maintenance Loop Signalling.  
- General commands and indicatio.  

## 2 H245的工作流
H323终端完成呼叫建立之后，端点应建立H.245控制信道。H.245控制信令协议用于媒体能力交换和打开/关闭媒体信道。可选地，H.245控制信道可由被叫端点接收到SETUP消息之后建立；或者主叫端点收到提示或呼叫消息之后建立。如果Connect没有到达，或者一个端点释放信道，H.245控制信道将被关闭。终端系统能力通过传输H.245终端能力集来交换信息。该能力消息应该是发送的第一个H.245消息。H.245可以确定终端的主从关系；H.245可以打开双向数据通道。如果初始能力交换或主从确定程序失败，终端至少需要重试2次再进入错误处理流程。

### 2.1  初始通信能力交换
H323终端完成呼叫建立之后，端点应建立H.245控制信道。H.245控制信令协议用于媒体能力交换和打开/关闭媒体信道。为了节约资源，同步呼叫信令和控制，并减少呼叫建立时间，我们希望在Q.931呼叫信令信道内传送H.245消息而不是建立一个单独的H.245信道。这个被称为打包或隧道化，H.245消息是通过在呼叫中使用h323_uu_pdu的h245Control元素来完成的信令信道，将编码的H.245消息复制为八位组串。当隧道处于活动状态时，可以在任何Q.931消息中封装一个或多个H.245消息。

### 2.2 建立多媒体通信
- 模式改变在会话期间，改变信道结构，能力，接收模式等的程序应按H.245建议书的规定进行。附录V / H.245包含了一个在逻辑信道上改变模式的过程，这可以使音频的中断最小化。
- 通过双方协商交换视频指示videoIndicateReadyToActivate在H.245建议书中定义。它的使用是可选的，但使用时的程序如下。
- 媒体流地址分配在单播中，端点应向MCU或其他端点开放逻辑信道。地址在openLogicalChannel和openLogicalChannelAck中传递。
- 多点会议中媒体流的相关性在多点会议中，应使用以下方法将逻辑信道与RTP流相关联。媒体流源端点将openLogicalChannel消息发送给MC。
- 通信模式命令程序H.323 MC发送H.245 CommunicationModeCommand来指定每种媒体类型的通信模式：单播或多播。

### 2.3 呼叫服务质量
- 带宽协商：带宽变化在接纳交换期间，呼叫带宽最初由网守建立和批准。端点应确保所有发送和接收的音频和视频通道的聚合(不包括任何RTP头，RTP有效载荷头，网络头和其他开销)在此带宽内。数据和控制通道不包括在这个限制内。
- 状态交换：为了使关守能够确定一个端点是否关闭，或者是否进入了一个失败模式，关守可以使用信息请求（IRQ）/信息请求响应（IRR）消息序列（见建议H. 225.0）以制造商决定的间隔轮询端点。


### 2.4 结束呼叫
任何一个端点都可以通过以下过程来终止一个呼叫：
- 1）应该在一个完整的图像的末尾停止传输视频，然后关闭所有的视频逻辑信道。 
- 2）应停止传输数据，然后关闭所有数据逻辑通道。 
- 3）应停止传输音频，然后关闭所有音频逻辑通道。 
- 4）它应在H.245控制信道中发送H.245 endSessionCommand消息，向远端表示它希望中断呼叫，然后中断H.245消息传输。 
- 5）然后等待接收来自另一个端点的endSessionCommand消息，然后关闭H.245控制信道。 
- 6）如果呼叫信令信道是开放的，则发送释放完成消息并关闭信道。 7）应使用以下规定的程序清除呼叫。

### 2.5 协议失败处理
在报告协议失败之前，H.245控制信道的底层可靠协议使用适当的努力在信道上传送或接收数据。 因此，如果在信道上报告协议故障，则应关闭H.245控制信道和所有相关的逻辑信道。

## 3 参考文献
https://www.packetizer.com/ipmc/h323/papers/primer/#gatekeepers

## 关于MTAVIPClient.git项目
- [MTH323Client-1 H323 Protocol Overview](/doc/cn/MTH323Client/1-H323-Overview.md)
- [MTH323Client-2 Open Source Ecology for H323 Video Conference](/doc/cn/MTH323Client/2-h323-open-source-ecology.md)
- [MTH323Client-3 H323 Terminal](/doc/cn/MTH323Client/3-h323-device.md)
- [MTH323Client-4 H225 Workflow for Call Signal](/doc/cn/MTH323Client/4-h225-call-signal-workflow.md)
- [MTH323Client-5 H245 Workflow for Control Signal](/doc/cn/MTH323Client/5-h245-control-signal-workflow.md)
- [MTH323Client-6 Design H323 Client using Open Source](/doc/cn/MTH323Client/6-design-h323-client.md)
- [MTH323Client-7 Docking H323 Cloud Service](/doc/cn/MTH323Client/7-docking-cloud-service.md)
