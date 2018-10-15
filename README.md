# 项目介绍

[https://github.com/fatedier/frp](https://github.com/fatedier/frp)

## 项目 demo 大概简要图

<img src="https://github.com/TelDragon/Dragon/blob/master/image/frp-Android-02.png" width="266" alt="frp-Android-02.png">   <img src="https://github.com/TelDragon/Dragon/blob/master/image/frp-Android-03.png" width="266" alt="frp-Android-03.png">   <img src="https://github.com/TelDragon/Dragon/blob/master/image/frp-Android-04.png" width="266" alt="frp-Android-04.png">

## 项目逻辑

* 启动初始化，写入预连接的服务器地址，服务器端口号，服务器toke
* 添加隧道
  * tcp协议，加密/压缩为非必选项，其他必填项
  * udp协议，加密/压缩为非必选项，其他必填项
  * http协议，加密/压缩为非必选项，自定义域名/泛域名二选一必填项
  * https协议，加密/压缩为非必选项，自定义域名/泛域名二选一必填项
* 隧道列表，可以复制分享列表内容

## 支持情况

* 支持
  * 手机免root
  * 自定义添加服务器
  * 协议tcp、udp、http、https
  * 加密、压缩
  * 动态添加隧道、删除隧道 (热加载)
  * 自定义域名、泛域名
  * 分享隧道信息
  * 后台运行
* 不支持
  * 保存配置文件(退出软件app后重新进入需再次填写信息)

  
 ## 开发计划

* 生成 0.13.0 demo 
* 支持多frps服务器版本
* 用户平台登录
* 获取用户位置信息收录统计
* 获取frps服务器列表信息，提供用户服务器选择匹配
* 保存配置信息
  
  
## 捐助

* 微信支付捐助

![winxin_pay.png](https://github.com/TelDragon/guacamole/blob/master/docs/_static/img/weixin_pay.png?raw=true)
 
