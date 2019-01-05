call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'junegunn/vim-easy-align'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'bronson/vim-trailing-whitespace'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'w0rp/ale'

" colorschemes
Plug 'drewtempelmeyer/palenight.vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'ayu-theme/ayu-vim'
Plug 'junegunn/seoul256.vim'
Plug 'liuchengxu/space-vim-dark'
Plug 'morhetz/gruvbox'
Plug 'whatyouhide/vim-gotham'
Plug 'arcticicestudio/nord-vim'
Plug 'joshdick/onedark.vim'

call plug#end()

colorscheme palenight

set foldmethod=indent
set foldlevel=1
set relativenumber

autocmd VimEnter * RainbowParentheses

map <C-n> :NERDTreeToggle<CR>
map <C-o> :NERDTreeFind<CR>
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.DS_Store$']

filetype indent plugin on
set wildmenu
syntax on
set showcmd
set hlsearch
set autoindent
set mouse=a
set shiftwidth=2
set softtabstop=2
set expandtab

nnoremap <C-k> <C-W>-
nnoremap <C-j> <C-W>+
nnoremap <C-l> <C-W>><C-W>>
nnoremap <C-h> <C-W><<C-W><
nnoremap H gT
nnoremap L gt

if executable('fzf')
  nnoremap <silent> <C-p> :FZF -m<cr>
  nnoremap <silent> <C-q> :Ag<cr>
  nnoremap <silent> <C-f> :Lines<cr>
  nnoremap <silent> <C-b> :Buffers<cr>
  nnoremap <silent> <C-c> :History<cr>

  " Better command history with q:
  command! CmdHist call fzf#vim#command_history({'right': '40'})
  nnoremap q: :CmdHist<CR>

  " Better search history
  command! QHist call fzf#vim#search_history({'right': '40'})
  nnoremap q/ :QHist<CR>
end

" Augmenting Ag command using fzf#vim#with_preview function
"   * fzf#vim#with_preview([[options], preview window, [toggle keys...]])
"     * For syntax-highlighting, Ruby and any of the following tools are required:
"       - Bat: https://github.com/sharkdp/bat
"       - Highlight: http://www.andre-simon.de/doku/highlight/en/highlight.php
"       - CodeRay: http://coderay.rubychan.de/
"       - Rouge: https://github.com/jneen/rouge
"
"   :Ag  - Start fzf with hidden preview window that can be enabled with "?" key
"   :Ag! - Start fzf in fullscreen and display the preview window above
command! -bang -nargs=* Ag
      \ call fzf#vim#ag(<q-args>,
      \                 <bang>0 ? fzf#vim#with_preview('up:60%')
      \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
      \                 <bang>0)

let g:ale_sign_error = 'x'
let g:ale_sign_warning = '*'
highlight clear ALEWarningSign

let b:ale_linters = {'javascript': ['eslint']}

" In ~/.vim/vimrc, or somewhere similar.
let g:ale_fixers = {
      \   '*': ['remove_trailing_lines', 'trim_whitespace'],
      \   'javascript': ['eslint'],
      \}


