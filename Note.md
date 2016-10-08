# Dig ActionCable

## 基本流程

环境准备：
rails server：基本页面渲染
bin/rails server
cable server: 消息订阅及推送服务
bin/cable

评论创建：
创建comment后, model层callback会向消息池 push message

页面通过action cable js订阅channel
并通过js callback handle相关消息事件，完成页面渲染

## 用户认证

rails server 通过controller层的authentication concern完成用户身份认证
成功后会写cookies.signed[:user_id] ||= user_id
该cookie会用于web的登录和消息通道的用户身份识别
在用户退出登录时，要清空此cookie

消息渠道中的身份识别

问题：
在api调用模式下如何识别用户？token？如何支持cookie

## 扩展

Message#publish_comment 可以之际服务端发送消息

* 未读数处理
* 是否在线状态

## Ref

