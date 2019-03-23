" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

"启动的时候不显示援助乌干达"
set shortmess=atI
"设置显示行号"
set nu
"语法高亮"
syntax on
"允许折叠"
set foldenable
"手动折叠"
"set foldenable=manual""
"++++++++++++++++++新建文件++++++++++++++++"
autocmd BufNewFile *.cpp,*.c,*.sh,*.java exec "call SetTitle()"
func SetTitle()
	call setline(1,"############################################")
	call append(line("."),"\# 文件名: ".expand("%"))
	call append(line(".")+1,"\# 作者：jiacheng")
	call append(line(".")+2,"\# 邮箱：437525123@qq.com")
	call append(line(".")+3,"\# 创建时间：".strftime("%c"))
	call append(line(".")+4,"\#############################################")
	
	if &filetype == 'sh'
		call append(line(".")+5,"\#!/bin/bash")
		call append(line(".")+6,"")
		:6gg<Tab>
	endif
	if &filetype == 'cpp'
		call append(line(".")+5,"#include<iostream>")
		call append(line(".")+6,"using namespace std;")
		call append(line(".")+7,"")
		call append(line(".")+8,"int main(int argc,char* argv[]){")
		call append(line(".")+9,"")
		call append(line(".")+10,"	return 0;")
		call append(line(".")+11,"}")
	endif
	if &filetype == 'c'
		call append(line(".")+5,"#include<stdio.h>")
		call append(line(".")+6,"")
		call append(line(".")+7,"int main(int argc,char* argv[]){")
		call append(line(".")+8,"	")
		call append(line(".")+9,"	return 0;")
		call append(line(".")+10,"}")
	endif
endfunc
"####################################################"
"键盘命令"
"####################################################"
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!gcc % -o %<"
		exec "!./%<"
	elseif &filetype == 'cpp'
		exec "g++ % -o %<"
		exec "!./%<"
	elseif &filetype == 'java'
		exec "!javac %"
		exec "!java %<"
	elseif &filetype == 'sh'
		:!,.%
	endif
endfunc

"自动缩进"
set autoindent
set cindent

"设置Tab键宽度"
set tabstop=4
set shiftwidth=4
"统一缩进为4"
set softtabstop=4
set shiftwidth=4
"不用空格代替制表符"
set noexpandtab
" 设置历史记录"
set history=1000
"禁止生成零时文件"
set nobackup
set noswapfile
"搜索忽略大小写"
set ignorecase
"设置搜索字符逐渐高亮"
set hlsearch
set incsearch
"c程序自动缩进"
set smartindent
"设置自动补全"
:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
:inoremap { {<CR>}<ESC>o
:inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
:inoremap " ""<ESC>i
:inoremap ' ''<ESC>i
function! ClosePair(char)
	if getline('.')[col('.')-1] == a:char
		return "\<Right>"
	else
		return a:char
	endif
endfunction
filetype plugin indent on
set completeopt=longest,menu
