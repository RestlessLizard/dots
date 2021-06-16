syntax enable
set termguicolors 
set background=dark 
"Indentation
set tabstop=4
set softtabstop=4

set shiftwidth=4
set autoindent

set copyindent		"copy indent from previous line

set number

set showmatch

" Search
set incsearch		
set hlsearch		"highlight matches
set smartcase
" use system clipboard by default
"set clipboard=unnamedplus

" Netrw (file tree)
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 3

"set spell spelllang=en_us

" esc to turn off search highlighting
nnoremap <silent> <esc> :noh<cr>

" stop cursor keys in normal mode
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

if !exists('g:vscode')

	call plug#begin('/home/liz/.config/nvim/plug/')

	Plug 'vimwiki/vimwiki'
	"Vimwiki path
	let g:vimwiki_list = [{'path': '~/.vimwiki', 'path_html': '~/.vimwiki_html'}]
	let g:vimwiki_folding = 'list'


	Plug 'sainnhe/gruvbox-material'

	let g:gruvbox_material_transparent_background = 1 
	let g:gruvbox_material_better_performance = 1
	let g:gruvbox_material_background = 'hard' 
	let g:gruvbox_material_palette = 'original'

	call plug#end()
	colorscheme gruvbox-material

endif

" Custom shortcuts
vmap <C-c> "+y
