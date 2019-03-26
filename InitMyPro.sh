############################################
# 文件名: InitMyPro.sh
# 作者：jiacheng
# 邮箱：437525123@qq.com
# 创建时间：2019年03月26日 星期二 23时35分30秒
#############################################
!/bin/bash
apt-get install vim
apt-get install git
ssh-keygen
cat ~/.ssh/id_rsa.pub 
echo "请将公钥粘贴到github上!!"
read -p "Continue(y/n)?" CONT
if [ "$CONT" = "n" ]; then
	exit 0;
fi
git clone git@github.com:zhangjiacheng1991/MyData.git && cp ./MyData/katoolin/katoolin.py /usr/bin/katoolin && chmod +x /usr/bin/katoolin



