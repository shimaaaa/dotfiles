set fenc=utf-8
colorscheme zellner

"ターミナルで256色表示を使う
set t_Co=256

"自動インデントを有効化する
set smartindent
set autoindent

"検索結果をハイライトする
set hlsearch

"ルーラー,行番号を表示
set ruler
set number

"ステータスラインにコマンドを表示
set showcmd
" ファイル名表示
set statusline=%F
" 変更チェック表示
set statusline+=%m
" 読み込み専用かどうか表示
set statusline+=%r
" ヘルプページなら[HELP]と表示
set statusline+=%h
" プレビューウインドウなら[Prevew]と表示
set statusline+=%w
" これ以降は右寄せ表示
set statusline+=%=
" file encoding
set statusline+=[ENC=%{&fileencoding}]
" 現在行数/全行数
set statusline+=[LOW=%l/%L]
" ステータスラインを常に表示(0:表示しない、1:2つ以上ウィンドウがある時だけ表示)
set laststatus=2

" yaml setting
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
