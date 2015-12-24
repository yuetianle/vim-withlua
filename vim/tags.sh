#########################################################################
# File Name: tags.sh
# Author: lishida
# mail: shida.li@tescomm.com.cn
# Created Time: 2015年03月07日 星期六 10时32分19秒
#########################################################################
#!/bin/bash

#
# File: ctags.sh
# Author: zhankunlin
# Date: 2011-11-30
# Desc: ctags 生成系统库以及ACE, SQLITE, ORACLE相关函数的tags, 存放于 ~/.vim/systags 文件中
#
# 安装exuberant-ctags
mkdir -p ~/.vim;

ctags -I __THROW -I __attribute_pure__ -I __nonnull -I __attribute__  --file-scope=yes --langmap=c:+.h --languages=c,c++ --links=yes --c-kinds=+p --c++-kinds=+p --fields=+iaS --extra=+q  -f ~/.vim/systags /usr/include/* /usr/include/netinet/* /usr/include/arpa/* /usr/local/include/* /usr/local/include/libavcodec/* /usr/local/include/libavdevice/* /usr/local/include/libavfilter/*  /usr/local/include/libavformat/*  /usr/local/include/libavutil/* /usr/local/include/libpostproc/* /usr/local/include/libswresample/* /usr/local/include/libswscale/*
printf '\n\n"ctags"
"========================="
set tags+=~/.vim/systags
"========================="' >> ~/.vimrc

