# openwrt-packages

# 请不要fork本仓库，因为你fork的源码不会根据插件源码作者的更新而自动更新。

#### 1、本仓库收集的插件均为lean大大源码内没包含的插件，本插件源码仅适用于lean大大的源码，在此对lean以及这些插件源码的所有作者表示感谢。

#### 2、本仓库每天两次自动从上游源码仓库拉取更新，分别在中午12点和凌晨12点各拉取一次，将一直自动保持该仓库的所有源码为最新状态。

#### 3、每个插件包都已添加进去了所有的依赖插件，无需自己寻找依赖，直接拉取即可编译使用。

#### 4、请求加入xxx软件包或者问题反馈请使用issue

#### 5、本仓库内的luci-theme-argon主题插件与lean源码自带的argon主题有冲突，如果您要使用该插件，请先删除lean源码自带的argon主题。（个人觉得本仓库的argon主题要好看的多）



## 使用方式有两种：（以下操作均默认您已拉取lean的源码）

## 方法一、
cd进package目录，然后执行
```bash
git clone https://github.com/dodojie/openwrt-packages
```
 
## 方法二、
添加下面代码到feeds.conf.default文件（在lean源码根目录里）
```bash
src-git dodojie_packages https://github.com/dodojie/openwrt-packages
```


## 通过以上两种方法（二选一）添加了本仓库源码之后再执行
```bash
./scripts/feeds update -a
```
```bash
./scripts/feeds install -a
```
```bash
make menuconfig
```

# 插件说明

luci-app-autotimeset #定时重启、定时关机、定时重启网络  
luci-app-autoupdate #自动从github拉取、更新固件  
luci-app-beardropper #阻止外网恶意连接ssh，根据规则自动屏蔽未知ip  
luci-app-control-timewol #使用wol工具定时唤醒局域网内设备  
luci-app-control-webrestriction #控制局域网设备能否连接到互联网  
luci-app-control-weburl #对局域网设备进行任意网址的阻止访问  
luci-app-cpulimit #对路由器某个进程限制cpu使用率  
luci-app-dockerman #docker管理界面  
luci-app-eqos #可以对单个设备限速  
luci-app-godproxy #集合多个规则的广告过滤（推荐）  
luci-app-iptvhelper #融合IPTV组播和应用数据到家庭局域网中  
luci-app-lean-ssr #富强、民主、爱国、敬业  
luci-app-netspeedtest #内网和外网测速  
luci-app-oaf #针对某些互联网应用进行过滤  
luci-app-omcproxy #组播代理（多应用于iptv组播数据代理进局域网）  
luci-app-passwall #富强、民主、爱国、敬业  
luci-app-serverchan #微信推送  
luci-app-smartdns #本地高性能DNS服务器，支持返回最快IP，支持广告过滤  
luci-app-socat #多功能网络工具,类似于netcat  
luci-app-tcpdump #网络抓包工具（需配合wireshark使用）  
luci-app-ttnode #甜糖星愿自动采集  
luci-app-vssr #富强、民主、爱国、敬业  
luci-theme-argon #argon主题（与lean源码自带的argon主题冲突，使用此主题，请先删除lean源码自带的argon主题）  
