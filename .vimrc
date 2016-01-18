" use pathongen
execute pathogen#infect()

" Basic setup
syntax on
filetype plugin indent on
" show line numbers
set number
" smart search
set smartcase
set ignorecase

" indent width
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set clipboard=unnamed


" Manual folder method
set nofoldenable    " disable folding

" Better js syntax with https://github.com/jelera/vim-javascript-syntax
au FileType javascript call JavaScriptFold()
augroup vimrc
	au BufReadPre * setlocal foldmethod=indent
	au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
augroup END

" key mappings
map <C-e> :NERDTreeToggle<CR>

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
au bufwritepost *.js SyntasticCheck

let g:elm_jump_to_error = 0
let g:elm_make_output_file = "elm.js"
let g:elm_make_show_warnings = 1
let g:elm_browser_command = ""
let g:elm_detailed_complete = 0
au bufwritepost *.elm elmmakemain


if filereadable(".vim.custom")
    so .vim.custom
endif
