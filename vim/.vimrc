execute pathogen#infect()
syntax on
set number
set tabstop=4
set shiftwidth=4
filetype plugin indent on
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview 
:set list lcs=tab:\|\ 
