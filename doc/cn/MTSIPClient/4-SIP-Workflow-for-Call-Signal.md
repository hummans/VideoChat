> Webcome to project:[MTAVIPClient](https://www.github.com/MTMediaDev/MTAVIPClient); Expecting you to join!
> **MTAVIPClient** supports H323 and SIP protocols.   
> **MTAVIPClient** means Audio/Video over IP networkd.  

**SIPClient-4 SIP Workflow for Call Signal** 
## 1 SIP的请求(rfc3261-4 Overview of Operation)
**SIP Request**通过具有用于起始行的请求线来区分。 Request-Line包含一个方法名,一个Request-URI和一个空格(SP)字符分隔的协议版本。
请求行以CRLF结束。 除了在行尾CRLF序列外,不允许使用CR或LF。 在任何元素中都不允许有线性空白(LWS)。
>  Request-Line  =  Method SP Request-URI SP SIP-Version CRLF
- Method：这个规范定义了六个方法：REGISTER(终端注册到服务器), INVITE(用户或者服务器被邀请参与这个会话), ACK(INVITE请求), CANCEL(取消PendingRequest), BYE(通知服务器结束会话),OPTIONS(查询服务器能力)。SIP扩展协议可能包含更多的附加方法。
- Request-URI：Request-URI是一个SIP或者SIPS URI的描述,它表明该请求所针对的用户或服务。Request-URI不能包含未转义的空格或控件字符。
- SIP-Version：请求和响应消息都包括正在使用的SIP版本,一般为SIP 2.0而非HTTP 1.1, 字符串要求大写。

## 2 SIP应答
**SIP responses**以状态行为起点的请求区分开来。状态行由协议版本和数字状态代码及其相关文本短语组成，每个元素由一个SP字符分隔。除最后的CRLF序列外，不允许使用CR或LF。

> Status-Line  =  SIP-Version SP Status-Code SP Reason-Phrase CRLF

**Status-Code**状态码是3位整数表示，表示试图理解和满足请求的结果。**Reason-Phrase**旨在简要说明状态码。**Status-Code**给机器使用，**Reason-Phrase**给人类用户使用。
**Status-Code**的第一个数字定义了响应的类别。最后两位数字没有任何分类角色。出于这个原因，状态码在100到199之间的任何响应被称为“1xx响应”，状态码在200和299之间的任何响应被称为“2xx响应”，依此类推。 SIP 2.0定义了六种状态码：

1xx：临时 - 收到请求，继续处理请求;
2xx：成功 - 行动成功接受，理解和接受;
3xx：重定向 - 需要采取进一步行动才能完成请求;
4xx：客户端错误 - 请求包含错误的语法或无法在此服务器上执行;
5xx：服务器错误 - 服务器无法完成有效的请求;
6xx：全局故障 - 请求无法在任何服务器上完成。

## 3 Workflow for Call Signal
```
                     atlanta.com  . . . biloxi.com
                 .      proxy              proxy     .
               .                                       .
       Alice's  . . . . . . . . . . . . . . . . . . . .  Bob's
      softphone                                        SIP Phone
         |                |                |                |
         |    INVITE F1   |                |                |
         |--------------->|    INVITE F2   |                |
         |  100 Trying F3 |--------------->|    INVITE F4   |
         |<---------------|  100 Trying F5 |--------------->|
         |                |<-------------- | 180 Ringing F6 |
         |                | 180 Ringing F7 |<---------------|
         | 180 Ringing F8 |<---------------|     200 OK F9  |
         |<---------------|    200 OK F10  |<---------------|
         |    200 OK F11  |<---------------|                |
         |<---------------|                |                |
         |                       ACK F12                    |
         |------------------------------------------------->|
         |                   Media Session                  |
         |<================================================>|
         |                       BYE F13                    |
         |<-------------------------------------------------|
         |                     200 OK F14                   |
         |------------------------------------------------->|
         |                                                  |

         Figure 1: SIP session setup example with SIP trapezoid
```
文本编码消息的第一行包含方法名称（INVITE）。 接下来的行是一个头字段的列表。 这个例子包含一个最小需求集合。 标题字段简要描述如下：
Via包含爱丽丝希望接收对此请求的响应的地址（pc33.atlanta.com）。 它还包含标识此事务的分支参数。
```
INVITE sip:bob@biloxi.com SIP/2.0
Via: SIP/2.0/UDP pc33.atlanta.com;branch=z9hG4bK776asdhds
Max-Forwards: 70
To: Bob <sip:bob@biloxi.com>
From: Alice <sip:alice@atlanta.com>;tag=1928301774
Call-ID: a84b4c76e66710@pc33.atlanta.com
CSeq: 314159 INVITE
Contact: <sip:alice@pc33.atlanta.com>
Content-Type: application/sdp
Content-Length: 142

(Alice's SDP not shown)
```
在这个例子中，Bob的SIP终端发送一个200(OK)响应，表示该呼叫已经被应答。 200(OK)包含一个消息主体，其中包含了Bob愿意与Alice建立会话类型的SDP媒体描述。 

```
SIP/2.0 200 OK
Via: SIP/2.0/UDP server10.biloxi.com;branch=z9hG4bKnashds8;received=192.0.2.3
Via: SIP/2.0/UDP bigbox3.site3.atlanta.com;branch=z9hG4bK77ef4c2312983.1;received=192.0.2.2
Via: SIP/2.0/UDP pc33.atlanta.com;branch=z9hG4bK776asdhds ;received=192.0.2.1
To: Bob <sip:bob@biloxi.com>;tag=a6c85cf
From: Alice <sip:alice@atlanta.com>;tag=1928301774
Call-ID: a84b4c76e66710@pc33.atlanta.com
CSeq: 314159 INVITE
Contact: <sip:bob@192.0.2.4>
Content-Type: application/sdp
Content-Length: 131
(Bob's SDP not shown)
```
SDP消息有两阶段交换：Alice发送一个会话邀请给Bob，Bob发送一个应答给Alice。 这种两阶段交换提供了基本的谈判能力，并基于简单的SDP交换提供/回答模型。

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