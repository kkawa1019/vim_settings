source $VIMRUNTIME/defaults.vim


set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set smartindent

set number
set cursorline
syntax enable

set hlsearch
set incsearch
set clipboard+=unnamed
set laststatus=2
set wildmenu


 inoremap { {}<Left>
 inoremap {<Enter> {}<Left><CR><BS><ESC><S-o> 
 inoremap ( ()<ESC>i 
 inoremap (<Enter> ()<Left><CR><BS><ESC><S-o> 
 "inoremap " ""<Left> 
 "inoremap ' ''<Left> 


"C言語系のインデント
filetype on

augroup vimrc
    autocmd!

    autocmd FileType c,cpp,java setl cindent
    "autocmd Filetype c,cpp,java setl expandtab tabstop=4 shiftwidth=4 softtabstop=4
augroup END

"if has('persistent_undo')
"    let undo_path = expand('~/.vim/undo')
"    exe 'set undodir=' .. undo_path
"    set undofile
"endif
  

" dein.vim settings {{{
" install dir {{{
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
" }}}

" dein installation check {{{
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . s:dein_repo_dir
endif
" }}}

" begin settings {{{
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " .toml file
  let s:rc_dir = expand('~/.vim')
  if !isdirectory(s:rc_dir)
    call mkdir(s:rc_dir, 'p')
  endif
  let s:toml = s:rc_dir . '/dein.toml'

  " read toml and cache
  call dein#load_toml(s:toml, {'lazy': 0})

  " end settings
  call dein#end()
  call dein#save_state()
endif
" }}}

" plugin installation check {{{
if dein#check_install()
  call dein#install()
endif
" }}}

" plugin remove check {{{
let s:removed_plugins = dein#check_clean()
if len(s:removed_plugins) > 0
  call map(s:removed_plugins, "delete(v:val, 'rf')")
  call dein#recache_runtimepath()
endif
" }}}
