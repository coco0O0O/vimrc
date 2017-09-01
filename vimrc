"windows system default setting begin
set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin
"windows system default setting end

"setting for tags begin
set tags=tags;
set autochdir
"setting for tags end

" 允许退格键删除和tab操作  
set smartindent  
set smarttab  
set expandtab  
set tabstop=4  
set softtabstop=4  
set shiftwidth=4  
set backspace=2
set textwidth=79
set nobackup
" 启用鼠标  
set mouse=a  
" 启用行号  
set nu 
" 启用折叠  
set foldmethod=syntax 
set foldcolumn=5

"set encoding begin
set fileencodings=ucs-bom,utf-8,cp936,gb10830,big5,euc-jp,euc-kr,latin1
set encoding=utf-8
set termencoding=cp936
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
language messages zh_CN.UTF-8
"set encoding end

"adding short cut for plugin taglist begin
nnoremap <silent> <F2> :TlistToggle<CR><CR>
let Tlist_Sort_Type = "name"
let Tlist_Exit_OnlyWindow = 1
let Tlist_Show_One_File = 1
"adding short cut for plugin taglist end
"
"adding short cut for plugin NERDTree begin
nnoremap <silent> <F1> :NERDTreeToggle<CR><CR>
let g:NERDTreeDirArrowExpandable = '►'
let g:NERDTreeDirArrowCollapsible = '▼'
"adding short cut for plugin NERDTree end

"adding short cut for tab shift
nnoremap <silent> <C-Tab> :tabnext<CR><CR>
"adding short cut for tab shift

"gui setting begin
"set guifont=微软雅黑:h16
"set guifont=YaHei\ Consolas\ Hybrid:h14
set guifont=Consolas:h16
colorscheme desert
"gui setting end

"vundle setting begin
filetype off                  " required
set rtp+=$VIM/vimfiles/vundle
call vundle#begin(expand($VIM).'/vimfiles/bundle')
Plugin 'coco0O0O/comments.vim'
Plugin 'coco0O0O/vim-monokai'
Plugin 'coco0O0O/tagbar'
Plugin 'coco0O0O/matlab.vim'
Plugin 'coco0O0O/vim-matchit'
Plugin 'coco0O0O/neocomplcache.vim'
Plugin 'coco0O0O/nerdtree'
"Plugin 'coco0O0O/vim-nerdtree-tabs'
"Plugin 'coco0O0O/YouCompleteMe'
call vundle#end()            " required
filetype plugin indent on    " required
"vundle setting end
"
let g:neocomplcache_enable_at_startup = 1

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

