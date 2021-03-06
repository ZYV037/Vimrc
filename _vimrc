"Aaron Zhang's vimrc
"Start 2016/05/10
"Email: 461177348@qq.com

"This work is licensed under the Creative Commons Attribution 4.0 
"International License. To view a copy of this license, 
"visit http://creativecommons.org/licenses/by/4.0/.

set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction


" 配置多语言环境,解决中文乱码问题
if has("multi_byte")
    "UTF-8 编码
    set encoding=utf-8
    set termencoding=utf-8
    set formatoptions+=mM
    set fencs=utf-8,gbk
    if v:lang =~? '^/(zh/)/|/(ja/)/|/(ko/)'
        set ambiwidth=double
    endif
    if has("win32")
        source $VIMRUNTIME/delmenu.vim
        source $VIMRUNTIME/menu.vim
        language messages zh_CN.utf-8
    endif
else
    echoerr "Sorry, this version of (g)vim was not compiled with +multi_byte"
endif

" Use bundles config {
    if filereadable(expand("$VIM/_vimrc.bundles"))
        source $VIM/_vimrc.bundles
    endif
" }

set nu
set tags=tags;
set autochdir
"color desert
colorscheme solarized
syntax enable
syntax on
"set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set hlsearch

"set autowrite                       " Automatically write a file when leaving a modified buffer
set shortmess+=filmnrxoOtT          " Abbrev. of messages (avoids 'hit enter')
set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
set virtualedit=onemore             " Allow for cursor beyond last character
set history=1000                    " Store a ton of history (default is 20)
set spell                           " Spell checking on
set hidden                          " Allow buffer switching without saving
set iskeyword-=.                    " '.' is an end of word designator
set iskeyword-=#                    " '#' is an end of word designator
set iskeyword-=-                    " '-' is an end of word designatoa

set guifont=Andale_Mono:h10,Menlo:h10,Consolas:h12,Courier_New:h10


"let g:ycm_path_to_python_interpreter = '/usr/bin/python'
let g:ycm_server_keep_logfiles = 1
let g:YcmDebugInfo = '~/.vim/bundle/YouCompleteMe/log.txt'
let g:ycm_server_log_level = 'debug'
let g:YcmToggleLogs='~/.vim/bundle/YouCompleteMe/log.txt'
"let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'

winpos 0 0          " 设定窗口位置  
set lines=60 columns=138    " 设定窗口大小  
