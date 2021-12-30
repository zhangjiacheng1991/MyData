############################################
# 文件名: InitMyPro.sh
# 作者：jiacheng
# 邮箱：437525123@qq.com
# 创建时间：2019年03月26日 星期二 23时35分30秒
#############################################
!/bin/bash
echo "安装系统工具"
apt-get install gcc g++ gdb vim git net-tools -y

echo "配置git"
git config --global user.email "437525123@qq.com"
git config --global user.name "zhangjiacheng1991"

echo "安装输入法"
apt-get install fcitx fcitx-googlepinyin fcitx-module-cloudpinyin fcitx-sunpinyin -y

echo 生成ssh证书
ssh-keygen

cat ~/.ssh/id_rsa.pub 
echo "请将公钥粘贴到github上!!"
read -p "Continue(y/n)?" CONT
if [ "$CONT" = "n" ]; then
	exit 0;
fi


#install libusb1.0
apt-get install libusb-dev
apt-get install libusb-1.0-0-dev
