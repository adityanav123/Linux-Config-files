syntax on

set autoindent
set tabstop=4
set shiftwidth=4
set smarttab
set softtabstop=4
set mouse=a


nnoremap <C-s> :w<CR> 
" save.
nnoremap <C-x> :wq<CR> 
" save and quit
nnoremap <C-r> :source ~/.config/nvim/init.vim<CR> 
" re-source vim init file.
nnoremap <C-n> :tabnew<CR>

call plug#begin("~/.config/nvim/plugged")
	Plug 'preservim/nerdtree'
	Plug 'voldikss/vim-floaterm'
	Plug 'itchyny/lightline.vim'
	Plug 'majutsushi/tagbar'
	Plug 'preservim/nerdcommenter'
	Plug 'ryanoasis/vim-devicons'	
	Plug 'neoclide/coc.nvim'
call plug#end()


" Nerd Tree : file explorer
nnoremap <C-f> :NERDTreeToggle<CR>

" enable terminal floating window in vim 
nnoremap <F5> :FloatermNew --height=0.75 --width=0.75 --wintype=float<CR>

" lightline config
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }


" tagbar -> shows variables, function names
nnoremap <F8> :TagbarToggle<CR>


" Nerd Commenter Config.
filetype plugin on

