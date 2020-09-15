syntax on

set nocompatible
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set encoding=UTF-8
set backspace=2
" Give more space for displaying messages.
set cmdheight=2

set updatetime=50

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

"Kite"
set completeopt+=noinsert
let g:kite_documentation_continual=0
let g:kite_snippets=0

call plug#begin('~/.vim/plugged')

"Backgrounds"
Plug 'morhetz/gruvbox'
Plug 'rakr/vim-one'
Plug 'drewtempelmeyer/palenight.vim'

"File Icons"

Plug 'preservim/nerdtree'

Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-fugitive'
Plug 'leafgarland/typescript-vim'
Plug 'vim-utils/vim-man'
Plug 'lyuts/vim-rtags'
Plug 'mbbill/undotree'

Plug 'jiangmiao/auto-pairs'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'

Plug 'Valloric/YouCompleteMe'

Plug 'ryanoasis/vim-devicons'
Plug 'majutsushi/tagbar'
call plug#end()

colorscheme gruvbox 
set background=dark

let g:ycm_python_binary_path = 'python3'
let g:ycm_global_ycm_extra_conf = '${HOME}/.ycm_extra_conf.py'
let g:ycm_auto_trigger = 1
let g:ycm_min_num_of_chars_for_completion = 3
let g:ycm_autoclose_preview_window_after_insertion = 1
set completeopt-=preview

if executable('rg')
    let g:rg_derive_root='true'
endif

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let mapleader = " "

let g:netrw_browse_split = 2
let g:netrw_banner = 0
let g:netrw_winsize = 25

let g:ctrlp_use_caching = 0

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <Leader>ps :Rg<SPACE>
nnoremap <silent> <Leader>+ :vertical resize +5<CR>
nnoremap <silent> <Leader>- :vertical resize -5<CR>

if exists('g:loaded_quickrun')
  finish
endif
let g:loaded_quickrun = 1

let s:save_cpo = &cpo
set cpo&vim


command! -nargs=* -range=0 -complete=customlist,quickrun#complete QuickRun
\ call quickrun#command(<q-args>, <count>, <line1>, <line2>)


nnoremap <silent> <Plug>(quickrun-op)
\        :<C-u>set operatorfunc=quickrun#operator<CR>g@

nnoremap <silent> <Plug>(quickrun) :<C-u>QuickRun -mode n<CR>
vnoremap <silent> <Plug>(quickrun) :<C-u>QuickRun -mode v<CR>

" Default key mappings.
if !hasmapto('<Plug>(quickrun)')
\  && (!exists('g:quickrun_no_default_key_mappings')
\      || !g:quickrun_no_default_key_mappings)
  silent! map <unique> <Leader>r <Plug>(quickrun)
endif

let &cpo = s:save_cpo
unlet s:save_cpo


let g:airline#extensions#tabline#enabled = 1
nmap <C-p> <Plug>AirlineSelectPrevTab
nmap <C-n> <Plug>AirlineSelectNextTab
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#buffer_idx_format = {
	\ '0': '0 ',
	\ '1': '1 ',
	\ '2': '2 ',
	\ '3': '3 ',
	\ '4': '4 ',
	\ '5': '5 ',
	\ '6': '6 ',
	\ '7': '7 ',
	\ '8': '8 ',
	\ '9': '9 '
	\}

let g:airline_theme = 'gruvbox'
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Nerd\ Font\ Complete\ 12
set encoding=utf-8

" フォルダアイコンを表示
let g:WebDevIconsNerdTreeBeforeGlyphPadding = ""
let g:WebDevIconsUnicodeDecorateFolderNodes = v:true
" after a re-source, fix syntax matching issues (concealing brackets):
if exists('g:loaded_webdevicons')
    call webdevicons#refresh()
endif
