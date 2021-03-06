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

" spell checking
set spell

" path for ctags
set tags+=.git/tags

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
" 文字列の色を変更
autocmd ColorScheme * highlight String ctermfg=51
autocmd ColorScheme * highlight Character ctermfg=51

"Dein Script --------------------------------
" Add path to python 3
let g:python3_host_prog = system('(type pyenv &>/dev/null && echo -n "$PYENV_VIRTUAL_ENV/bin/python") || echo -n $(which python3)')

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
nnoremap tc :<C-u>tabnew<CR>
nnoremap tn :<C-u>tabNext<CR>
nnoremap tp :<C-u>tabprevious<CR>

" ハイライトを解除
nnoremap <F3> :noh<CR>

" Plugin mapping
let mapleader = "\<Space>"

" Git mapping
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>ga :Gwrite<CR>
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gl :Glog<CR>

" NERDTree mapping
nnoremap <Leader>n :NERDTreeToggle<CR>

" QuickRun mapping
nnoremap <Leader>qr :QuickRun<CR>

" TComment mapping
xnoremap <Leader>co :TComment<CR>

" Ctags mapping
nnoremap <Leader>ct :Ctags<CR>

" Tagbar mapping
nnoremap <Leader>tb :TagbarToggle<CR>

" Startify config
let g:startify_custom_header = [
  \"ポッポー",
  \".（；：)",
  \".(：；)",
  \".(：；)",
  \".(：；)",
  \"（；)",
  \"　[]　　　∧∧",
  \"　||　|可(・ω・`)",
  \"（ニニl Ｈ￣∪Ｈ￣|",
  \". y.tb-O-◎◎―◎◎",
  \]

" Denite mapping
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
        \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> d
        \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
        \ denite#do_map('do_action', 'previw')
  nnoremap <silent><buffer><expr> q
        \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> i
        \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space>
        \ denite#do_map('toggle_select').j
endfunction

function! g:GetVisualWord() abort
  let word = getline("'<")[getpos("'<")[2] - 1:getpos("'>")[2] - 1]
  return word
endfunction

function! g:GetVisualWordEscape() abort
  let word = substitute(GetVisualWord(), '\\', '\\\\', 'g')
  let word = substitute(word, '[.?*+^$|()[\]]', '\\\0', 'g')
  return word
endfunction

nnoremap <Leader>bb :Denite buffer<CR>
nnoremap <Leader>df :DeniteBufferDir file/rec<CR>
nnoremap <Leader>dF :DeniteProjectDir file/rec<CR>
nnoremap <Leader>dg :DeniteBufferDir -no-empty grep<CR>
nnoremap <Leader>dG :DeniteProjectDir -no-empty grep<CR>
xnoremap <Leader>vg :Denite grep:::`GetVisualWordEscape()`<CR>
xnoremap <Leader>vG :DeniteProjectDir grep:::`GetVisualWordEscape()`<CR>


" vimshell map
nnoremap <Leader>vs :VimShell<CR>
nnoremap <Leader>vsc :VimShellCreate<CR>
nnoremap <Leader>vp :VimShellPop<CR>

nnoremap <Leader>bp :bprev<CR>
nnoremap <Leader>bn :bnext<CR>
" fxでfix実行
nnoremap <Leader>fl :ALEFix<CR>

" mp で MarkdownPreview 起動
nnoremap <Leader>mp :MarkdownPreview<CR>

" python の docstring 生成
nnoremap <Leader>pd :Docstring<CR>

colorscheme molokai
hi Comment ctermfg=DarkGreen
