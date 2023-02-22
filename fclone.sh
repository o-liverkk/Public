#!/bin/bash
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin


function fclone_install()
{
	echo "检查Fclone......"
	fclone --version
    if [ $? -eq  0 ]; then
        echo -e "\033[32m检查到Fclone已安装!\033[0m"
    else
        echo -e "\n|   Fclone is installing ... "
        apt update
        apt install -y sudo unzip 
        #bash <(wget -qO- https://git.io/gclone.sh)
        sudo apt-get install -y unzip
        cd /tmp
        wget https://github.com/mawaya/rclone/releases/download/fclone-v0.4.1/fclone-v0.4.1-linux-amd64.zip
        unzip fclone-v0.4.1-linux-amd64.zip
        cd fclone-v0.4.1-linux-amd64
        cp /tmp/fclone-v0.4.1-linux-amd64/fclone /usr/bin
        chmod +x /usr/bin/fclone
        # 安装fuse 支持
        sudo apt-get install -y fuse
    fi
}

fclone_install