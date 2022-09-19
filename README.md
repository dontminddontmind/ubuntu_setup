# ubuntu_setup （CTF PWN 工作环境配置 wsl+ohmyzsh+lunarvim+ctf-tools ）

## 安装
```bash
sudo apt install git
git clone https://github.com/dontminddontmind/ubuntu_setup ~/ubuntu_setup
cd ~/ubuntu_setup
#按照顺序依次执行setup文件
./00-dot_write.sh #把配置文件里的用户名改成当前用户的
# 编辑etc/profile.d/proxy.sh文件，把代理地址、协议和端口改成你的
./01-setup_net.sh #配置网络，apt镜像源，代理
cp ./.bashrc  ~/ #复制我的.bashrc配置
#重启以让网络配置生效，wsl不用重启，新开个terminal即可
reboot
proxy #开启代理 unproxy关闭
./02-setup_font.sh #安装zsh和lvim会用到的字体，wsl不用安
./03-setup_python.sh #安装python2和python3环境，用update-alternatives切换版本
#关闭terminal再打开，初始化virtualenv环境
./04-setup_zsh.sh #配置ohmyzsh，会自动打开zsh，输入exit退出以继续安装，重启后zsh会变成默认shell
cp ./.zshrc ./.p10k.zsh ~/ #复制我的zsh配置
./04-setup_lvim.sh #安装lunarvim，全部yes
cp ./.config/lvim/* ~/.config/lvim/  #复制我的lvim配置
#lvim 进入后输入<space>+L+c 重写一下配置文件，会自动下载插件
./05-setup_ctf.sh #配置pwn工具
#复制我写的一些pwn脚本到bin里
chmod 777 ./bin/*
cp ./bin/* ~/.local/bin/
#./06-setup_root_zsh.sh #让root也用上zsh（慎用，很多地址没有改成root的）
```
## 一些问题
### vmware的ubuntu网络有错误
```bash
#试试重启一下
sudo systemctl restart NetworkManager
```

## 宿主机配置
### wsl安装
* 启用或关闭windows功能 ，打开子系统和虚拟平台，重启（开了虚拟平台就用不了vmware等虚拟机了）
![image](https://user-images.githubusercontent.com/39674475/190902178-a5cf4246-1aa2-4914-a391-666b75299e84.png)
* 升级wsl kernel，在此处下载 https://docs.microsoft.com/en-us/windows/wsl/wsl2-kernel
#### 安装全新的wsl
* 在Microsoft Store里选一个linux系统安装，如果是win10还要安装windows terminal
* 在terminal里设置wsl2
```bash
wsl -l -v #列出wsl
wsl --set-version  Ubuntu-20.04 2 #把Ubuntu-20.04换成你的wsl的名字
wsl --set-default-version 2
```
#### 复制别人的wsl
```bash
#会装载很久，最好把能关的程序都关了，要不然会卡住不动
wsl --shutdown #关闭所有wsl
wsl --import wsl名 装载虚拟机的目录\wsl 压缩包的目录\ubuntu20.04.tar --version 2
wsl -l -v #检查一下
```
这样安装的wsl默认用户会是root
在虚拟机里打开/etc/wsl.conf文件，添加下面的内容改变默认用户
```
[user]
default=username
```
重启一下windows terminal如果没有自动生成新wsl的配置，就自己添加一个吧
![image](https://user-images.githubusercontent.com/39674475/190948233-c0a4675f-584d-48a1-bd90-05edb58ff869.png)

### 安装zsh和lvim的字体
下载字体，双击运行
https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Meslo/M/Regular/complete/Meslo%20LG%20M%20Regular%20Nerd%20Font%20Complete%20Mono.ttf
### windows Terminal配置
设置字体
![image](https://user-images.githubusercontent.com/39674475/190944643-ab3b446f-5bb1-4c20-86ea-56fba6fc3689.png)
用vim的话要把ctrl+v的键给删了（我已经删了）
![image](https://user-images.githubusercontent.com/39674475/190947642-8b20523e-6bf1-448d-86dd-05a6c99ef0b6.png)
vim在wsl中无法复制内容到宿主机，需要下载[win32yank](https://github.com/equalsraf/win32yank/releases/tag/v0.0.4)并添加到环境变量

### vscode连wsl
安装插件
![image](https://user-images.githubusercontent.com/39674475/190944140-032d166b-77d6-4364-b5f3-50dd82ac85ac.png)
就可以选择连接wsl了
![image](https://user-images.githubusercontent.com/39674475/190944195-73ab81b7-61d3-4673-94a8-53c87335250d.png)
给vscode的终端设置字体
ctrl+逗号或者点左下角的齿轮打开设置，输入font,点击功能-终端，找到如下位置，输入MesloLGM Nerd Font Mono字体即可。所作修改会在终端中即时显示。
![image](https://user-images.githubusercontent.com/39674475/190944726-860f8536-f8bf-4d4c-a374-372d209209cb.png)
如果没有自动识别wsl终端里的virtualenv，也就是pwntools等识别不到，输入ctrl+shift+p，搜索python interpreter或者python解释器，换成ctftools的python环境
![image](https://user-images.githubusercontent.com/39674475/190947490-8b37f1fc-dac8-427d-839f-4f71ffe8370c.png)
![image](https://user-images.githubusercontent.com/39674475/190947511-bd9321ac-387e-4362-ac34-c750cf173695.png)



