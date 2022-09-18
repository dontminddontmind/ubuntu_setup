# ubuntu_setup （CTF PWN 工作环境配置 wsl+ohmyzsh+lunnarvim+ctf-tools ）

## 安装
    sudo apt install git
    git clone https://github.com/dontminddontmind/ubuntu_setup ~/ubuntu_setup
    cd ~/ubuntu_setup
    #按照顺序依次执行setup文件
    ./00-dot_write.sh #复制.zshrc .bashrc .p10k.zsh 配置文件
    # 编辑etc/profile.d/proxy.sh文件，把代理地址、协议和端口改成你的
    ./01-setup_net.sh #配置网络，apt镜像源，代理
    #重启以让网络配置生效
    reboot
    proxy #开启代理 unproxy关闭
    ./02-setup_font.sh #安装zsh和lvim会用到的字体，wsl不用安
    ./03-setup_python.sh #安装python2和python3环境，用update-alternatives切换版本
    ./04-setup_zsh.sh #配置ohmyzsh
    cp -r ./.config/lvim ~/.config/ #复制我的lvim配置
    ./04-setup_lvim.sh #配置lunnarvim
    ./05-setup_ctf.sh #配置pwn工具
    #复制我写的一些pwn脚本到bin里
    chmod 777 ./bin/*
    cp ./bin/* ~/.local/bin/
    #./06-setup_root_zsh.sh #让root也用上zsh（慎用，很多地址没有改成root的）

## 一些问题
* vmware的ubuntu网络有错误
```bash
    #试试重启一下
    sudo systemctl restart NetworkManager
```
## 宿主机配置
### wsl宿主机

