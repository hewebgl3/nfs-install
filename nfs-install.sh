#!/bin/bash

# 注意nfs的目录是/root/nfs ,
install_nfs(){
    echo 'nfs开始成功-------'

    yum install -y nfs-utils

    mkdir -p /root/nfs

cat > /etc/exports <<EOF
/root/nfs   ${Net_segment}/24(rw,sync,no_root_squash)
EOF

    # 先启动rpcbind,再启动nfs
    systemctl start rpcbind
    systemctl start nfs

    netstat -anptu | grep rpcbind
    rpm -ql nfs-utils | grep show

    echo 'nfs安装成功-------'

}

install_nfs