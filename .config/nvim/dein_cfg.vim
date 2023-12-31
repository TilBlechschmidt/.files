if &compatible
  set nocompatible
endif

set rtp+=/usr/share/vim/vimfiles
set rtp+=/Users/themegatb/.cache/dein/repos/github.com/Shougo/dein.vim

call dein#begin(expand('~/.cache/dein'))

 " Plugins:

 "  Generic
 call dein#add('Shougo/neosnippet.vim')
 call dein#add('Shougo/neosnippet-snippets')
 call dein#add('tpope/vim-surround')
 call dein#add('tpope/vim-commentary')
 call dein#add('tpope/vim-eunuch')
 call dein#add('tpope/vim-repeat')
 call dein#add('tpope/vim-fugitive')
 call dein#add('vim-airline/vim-airline')
 call dein#add('Raimondi/delimitMate')
 call dein#add('airblade/vim-gitgutter')
 call dein#add('Shougo/deoplete.nvim')
 call dein#add('SirVer/ultisnips')
 call dein#add('scrooloose/nerdtree')
 call dein#add('Xuyuanp/nerdtree-git-plugin')

 "  Distraction free writing
 call dein#add('junegunn/limelight.vim')
 call dein#add('junegunn/goyo.vim')

 "  Themes
 call dein#add('vim-airline/vim-airline-themes')
 call dein#add('tyrannicaltoucan/vim-deep-space')
 call dein#add('ryanoasis/vim-devicons')

 "  Swift
 call dein#add('kballard/vim-swift', {'filetypes': 'swift', 'unite_sources': ['swift/device', 'swift/developer_dir']})

 "  JavaScript
 call dein#add('moll/vim-node')
 call dein#add('othree/yajs.vim', {'filetypes': 'javascript'})
 call dein#add('gavocanov/vim-js-indent', {'filetypes': 'javascript'})
 call dein#add('carlitux/deoplete-ternjs', {'filetypes': 'javascript'})
 call dein#add('elzr/vim-json', {'filetypes': 'json'})

 "  Markdown
 call dein#add('plasticboy/vim-markdown', {'filetypes': 'markdown'})
 call dein#add('dhruvasagar/vim-table-mode', {'filetypes': 'markdown'})

 "  CSV
 call dein#add('chrisbra/csv.vim', {'filetypes': 'csv'})

call dein#end()

filetype plugin indent on

" Autoinstall plugins
if dein#check_install()
  call dein#install()
endif


set background=dark
set termguicolors
colorscheme deep-space
let g:deepspace_italics=1

set number
set noswapfile
set tabstop=4
set smartcase
set expandtab
set shiftwidth=4
set cc=79
set completeopt-=preview
set encoding=utf8
set undofile
set undodir=~/.cache/nvim/undodir

"let g:airline_theme='luna'
let g:airline_theme='deep_space'
let g:airline_powerline_fonts=1
let g:airline_skip_empty_sections = 1
let g:deoplete#enable_at_startup = 1

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
