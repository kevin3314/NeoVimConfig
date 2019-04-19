set encoding=UTF-8
set nobackup
set noswapfile
set autoread
set hidden
set showcmd

set number
set smartindent
set showmatch
set ruler
set incsearch
set hlsearch
set nowrapscan
set backspace=indent,eol,start
set wildmode=list:longest

set laststatus=2

set expandtab
set tabstop=2
set shiftwidth=2

"エラーメッセージの時にピープを鳴らさない
set noerrorbells

if has('vim_starting')
    " 挿入モード時に非点滅の縦棒タイプのカーソル
    let &t_SI .= "\e[6 q"
    " ノーマルモード時に非点滅のブロックタイプのカーソル
    let &t_EI .= "\e[2 q"
    " 置換モード時に非点滅の下線タイプのカーソル
    let &t_SR .= "\e[4 q"
endif

syntax on

" ワーニン行のハイライトを変更
autocmd ColorScheme * highlight SpellCap ctermbg=52 gui=undercurl guisp=#FF0000

"Dein Script --------------------------------
" Add path to python 3
let g:python3_host_prog = expand('~/.pyenv/versions/3.7.0/bin/python')

"プラグインをインストールするディレクトリ
let s:dein_dir = expand('~/.cache/dein')
"dein.vim本体
let s:dein_repo_dir = s:dein_dir . 'repos/github.com/Shougo/dein.vim'

"deinがなければ、githubから落としてくる
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" 設定開始
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " プラグインリストを収めた TOML ファイル
  " 予め TOML ファイルを用意しておく
  let g:rc_dir    = expand("~/.config/nvim/")
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  " TOML を読み込み、キャッシュしておく
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  " 設定終了
  call dein#end()
  call dein#save_state()
endif

" インストールしていないものはこちらに入れる
if dein#check_install()
  call dein#install()
endif

filetype plugin indent on

" ウィンドウ分割を楽にする設定
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sq :<C-u>q<CR>
nnoremap sQ :<C-u>bd<CR>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap t, <C-w>>
nnoremap t. <C-w><
nnoremap t; <C-w>+
nnoremap t- <C-w>-

"タブ操作
nnoremap st :<C-u>tabnew<CR>

" vimshell map
nnoremap <silent> vs :VimShell<CR>
nnoremap <silent> vsc :VimShellCreate<CR>
nnoremap <silent> vp :VimShellPop<CR>

nnoremap <silent> bp :bprev<CR>
nnoremap <silent> bn :bnext<CR>
" fxでfix実行
nnoremap <silent> fl :ALEFix<CR>

colorscheme molokai
hi Comment ctermfg=DarkGreen
