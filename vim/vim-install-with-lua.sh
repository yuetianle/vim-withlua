#########################################################################
# File Name: vim-install-with-lua.sh
# Author: lishida
# mail: shida.li@tescomm.com.cn
# Created Time: Thursday, October 22, 2015 AM11:04:20 CST
#########################################################################
#!/bin/bash

sudo apt-get remove vim vim-runtime vim-gnome vim-tiny vim-common vim-gui-common
sudo apt-get purge vim vim-runtime vim-gnome vim-tiny vim-common vim-gui-common
sudo apt-get build-dep vim-gnome
sudo apt-get install luajit libluajit-5.1 libncurses5-dev libgnome2-dev libgnomeui-dev libgtk2.0-dev libatk1.0-dev libbonoboui2-dev libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev ruby-dev mercurial
git clone https://github.com/vim/vim.git
cd vim
./configure --with-features=huge --enable-cscope --enable-rubyinterp --enable-largefile --disable-netbeans --enable-pythoninterp --with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu --enable-perlinterp --enable-luainterp --with-luajit --enable-fail-if-missing --with-lua-prefix=/usr --enable-gui=gnome2  --enable-cscope --prefix=/usr

make VIMRUNTIMEDIR=/usr/share/vim/vim74
sudo make install
