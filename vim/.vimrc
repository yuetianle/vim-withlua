" 侦测文件类型
":filetype on
" 载入文件类型插件
":filetype plugin on
" 命令历史记录
set history=200
" 为特定文件类型载入相关缩进文件
"filetype indent on
"文件缓冲区快速遍历
nnoremap <silent> [b :bprevious<CR>

nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>
"光标键移动禁止
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

"常用命令工具
"nnoremap <C-F2> :vert diffsplit<CR> "比较文件
"map <M-F2> :tabnew<CR> "新建标签
"map <F3> :tabnew .<CR>  "列出当前目录和文件

"c,c++ F5编译
"map <F5>

"自动补全
":inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
:inoremap { {<CR>}<ESC>O
:inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
:inoremap " ""<ESC>i
:inoremap ' ''<ESC>i
function! ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endfunction
filetype plugin indent on 
"打开文件类型检测, 加了这句才可以用智能补全
set completeopt=longest,menu
"代码补全
set completeopt=preview,menu
"突出显示当前行
set cursorline
"突出显示当前列
"set cursorcolumn
"显示相关
"set shortmess=atI   " 启动的时候不显示那个援助乌干达儿童的提示  
"winpos 5 5          " 设定窗口位置  
"set lines=40 columns=155    " 设定窗口大小  
set nu              " 显示行号  
"set numuberwidth=12 "行宽

"英文拼写检查
set spell 	     "拼写检查
set spelllang=en    "语言检查
"setlocal spell spellang=zh
set spellsuggest=4 "拼写建议个数
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline
highlight clear SpellLocal
highlight SpellLocal term=underline cterm=underline

set autowrite 	   "自动保存
"set textwidth=50 	"文本大小
set go=             " 不要图形按钮  
"color asmanian2     " 设置背景主题  
set guifont=Courier_New:h10:cANSI   " 设置字体  
set hlsearch	    "查找高亮
set incsearch	    "搜索高亮
syntax on           " 语法高亮  
"if has("gui_gtk2")
"     set guifont=Bitstream\ Vera\ Sans\ Mono\ 12,Fixed\ 12
"    set guifontwide=Microsoft\ Yahei\ 12,WenQuanYi\ Zen\ Hei\ 12
"endif
autocmd InsertLeave * se nocul  " 用浅色高亮当前行  
autocmd InsertEnter * se cul    " 用浅色高亮当前行  
set ruler           " 显示标尺  
set showcmd         " 输入的命令显示出来，看的清楚些  
"set cmdheight=3    " 命令行（在状态行下）的高度，设置为1  
"set whichwrap+=<,>,h,l   " 允许backspace和光标键跨越行边界(不建议)  
"set scrolloff=3     " 光标移动到buffer的顶部和底部时保持3行距离  
set novisualbell    " 不要闪烁(不明白)  
set showmatch		"高亮显示匹配的括号
set wildmenu		"增强模式中的命令行自动完成操作
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v] [%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}   "状态行显示的内容  
set laststatus=2    " 启动显示状态行(1),总是显示状态行(2)  
set foldenable      " 允许折叠  
set foldmethod=manual   " 手动折叠  
"set background=dark "背景使用黑色 
set nocompatible  "去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限  
" 显示中文帮助
if version >= 603
    set helplang=cn
    set encoding=utf-8
endif
" 设置配色方案
"colorscheme murphy
"字体 
"if (has("gui_running")) 
"   set guifont=Bitstream\ Vera\ Sans\ Mono\ 10 
"endif 
 
"Tab键宽度
set tabstop=4
"统一缩进为4
set softtabstop=4
set shiftwidth=4
"不要用空格代替制表符
set noexpandtab
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936
set fileencoding=utf-8
"新建.c,.h,.sh,.java文件，自动插入文件头 
autocmd BufNewFile *.[ch],*.cpp,*.sh,*.java exec ":call SetTitle()" 
""定义函数SetTitle，自动插入文件头 
func SetTitle() 
    "如果文件类型为.sh文件 
    if &filetype == 'sh' 
        call setline(1,"\#########################################################################") 
        call append(line("."), "\# File Name: ".expand("%")) 
        call append(line(".")+1, "\# Author: lishida") 
        call append(line(".")+2, "\# mail: shida.li@tescomm.com.cn") 
        call append(line(".")+3, "\# Created Time: ".strftime("%c")) 
        call append(line(".")+4, "\#########################################################################") 
        call append(line(".")+5, "\#!/bin/bash") 
        call append(line(".")+6, "") 
    else 
        call setline(1, "/*************************************************************************") 
        call append(line("."),   " File Name: ".expand("%")) 
        call append(line(".")+1, " Author: lishida") 
        call append(line(".")+2, " Mail: shida.li@tescomm.com.cn ") 
        call append(line(".")+3, " Created Time: ".strftime("%c")) 
	call append(line(".")+4, " Function:")
        call append(line(".")+5, " ************************************************************************/") 
        call append(line(".")+6, "")
    endif
    if &filetype == 'cpp'
        call append(line(".")+6, "#include<iostream>")
        call append(line(".")+7, "using namespace std;")
        call append(line(".")+8, "")
    endif
    if &filetype == 'h'
	call append(line(".")+6, "#include <stdlib.h>")
	call append(line(".")+7, "#inlcude <stdio.h>")
	call append(line(".")+8, "#inlcude <unistd.h>")
	call append(line(".")+9, "")
    endif 
    if &filetype == 'c'
        call append(line(".")+6, "#include<stdio.h>")
        call append(line(".")+7, "")
    endif
    "新建文件后，自动定位到文件末尾
    autocmd BufNewFile * normal G
endfunc
"c类型文件自动缩进
":autocmd FileType c,cpp set cindent 
"编程设置
:abbreviate #d #define
:abbreviate #i #include
:abbreviate #b /***************************************************
:abbreviate #e <Space>*****************************/
:abbreviate #l /*------------------------------------------------*/
" CTags的设定  
let Tlist_Sort_Type = "name"    " 按照名称排序  
let Tlist_Use_Right_Window = 1  " 在右侧显示窗口  
let Tlist_Compart_Format = 1    " 压缩方式  
let Tlist_Exist_OnlyWindow = 1  " 如果只有一个buffer，kill窗口也kill掉buffer  
let Tlist_File_Fold_Auto_Close = 0  " 不要关闭其他文件的tags  
let Tlist_Enable_Fold_Column = 0    " 不要显示折叠树  
let Tlist_Show_One_File = 1 "不同时显示多个文件的tag，只显示当前文件的 
let Tlist_Exit_OnlyWindow = 1 "如果taglist窗口是最后一个窗口，则退出vim 
let Tlist_Use_Right_Window = 1 "在右侧窗口中显示taglist窗口
let Tlist_Auto_Open = 1 "默认打开TagList
"========================="
set tags+=~/.vim/systags
"========================="
"更新Tlist
map <F5> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR> :TlistUpdate<CR>
imap <F5> <ESC>:!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR> :TlistUpdate<CR>

"自动折叠
autocmd FileType c,cpp  setl fdm=syntax 
"默认不折叠
"autocmd FileType c,cpp  setl fen=false
"Doxygen 自动注释工具
let g:DoxygenToolkit_briefTag_pre="@brief "
let g:DoxygenToolkit_paramTag_pre="@param "
let g:DoxygenToolkit_returnTag="@returns "
let g:DoxygenToolkit_blockHeader="--------------------------------------------------------------------------"
let g:DoxygenToolkit_blockFooter="----------------------------------------------------------------------------"
let g:DoxygenToolkit_authorName="Drunkedcat"
let g:DoxygenToolkit_licenseTag="GPL 2.0"

let g:DoxygenToolkit_authorName="lee, shida23577@hotmail.com"
let s:licenseTag = "Copyright(C)\<enter>"
let s:licenseTag = s:licenseTag . "For free\<enter>"
let s:licenseTag = s:licenseTag . "All right reserved\<enter>"
let g:DoxygenToolkit_licenseTag = s:licenseTag
let g:DoxygenToolkit_briefTag_funcName="yes"
let g:doxygen_enhanced_color=1
"cVim 插件
let  g:C_UseTool_cmake    = 'yes' 
let  g:C_UseTool_doxygen = 'yes'


"-- omnicppcomplete setting --
"    "
"    按下F3自动补全代码，注意该映射语句后不能有其他字符，包括tab；否则按下F3会自动补全一些乱码
imap <F3> <C-X><C-O>
" 按下F2根据头文件内关键字补全
imap <F2> <C-X><C-I>
set completeopt=menu,menuone " 关掉智能补全时的预览窗口
let OmniCpp_MayCompleteDot = 1 " autocomplete with .
let OmniCpp_MayCompleteArrow = 1 " autocomplete with ->
let OmniCpp_MayCompleteScope = 1 " autocomplete with ::
let OmniCpp_SelectFirstItem = 2 " select first item (but don't insert)
let OmniCpp_NamespaceSearch = 2 " search namespaces in this and included files "
let OmniCpp_ShowPrototypeInAbbr = 1 " show function prototype in popup window
let OmniCpp_GlobalScopeSearch=1 " enable the global scope search
let OmniCpp_DisplayMode=1 " Class scope completion mode: always show all members
let OmniCpp_DefaultNamespaces=["std"]
let OmniCpp_ShowScopeInAbbr=1 " show scope in abbreviation and remove the last column
let OmniCpp_ShowAccess=1 

" 每行超过80个的字符用下划线标示
 au BufRead,BufNewFile *.asm,*.c,*.cpp,*.java,*.cs,*.sh,*.lua,*.pl,*.pm,*.py,*.rb,*.hs,*.vim 2match Underlined /.\%81v/
" 超过80个的字符高亮
au BufWinEnter * let w:m1=matchadd('Search', '\%<88v.\%>81v', -1)
au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
"工具提示
"set ballooneval

