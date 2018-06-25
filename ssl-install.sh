#!/bin/bash
# Script Name: ssl-install
# Author: Matt McKinnon
# Date: 28th May 2018
# Description:
#
#             Script used to copy Let's Encrypt Generated Certificates from generating server to ESXi VPS Server.
#             This script requires acme.sh be used to setup your Let's Encrypt Certificates.
#             - https://github.com/Neilpang/acme.sh
#
#             SSH Key Login also needs to be enabled on ESXi
#
#             
#
#

DOM_NAME="home.comprofix.com"
ESXI_SERVER="esxi.home.comprofix.com"


if [ ! -d ~/.acme.sh ]; then
    echo "Folder does not exist"
    exit 0
else
    # echo "You are using acme.sh. Well done"
fi


scp -q ~/.acme.sh/$DOM_NAME/$DOM_NAME.cer root@$ESXI_SERVER:/etc/vmware/ssl/rui.crt
scp -q ~/.acme.sh/$DOM_NAME/$DOM_NAME.key root@$ESXI_SERVER:/etc/vmware/ssl/rui.key
ssh -qt root@$ESXI_SERVER "/sbin/services.sh restart"



