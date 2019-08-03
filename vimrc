set history=500
set encoding=utf8
set fileencoding=utf8

set visualbell
set laststatus=2
set showmode
set showcmd

set ruler
set ignorecase
set smartcase
set incsearch
set hlsearch

set showmatch

set number
set relativenumber

syntax on
set cindent
set backspace=2
set smarttab
set tabstop=4
set shiftwidth=4
set textwidth=79
set wrap
set si

set nobackup
set noswapfile

" eol:↲,nbsp:␣, tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
set listchars=tab:▶\ ,extends:›,precedes:␣,nbsp:·,trail:·
set list

hi WhiteSpaces ctermbg=LightGrey
:hi GRPTAB ctermfg=88
:hi GRPWS ctermbg=248
:match GRPWS /\s+/
:2match GRPTAB /\t/

:hi cursorLine cterm=NONE ctermbg=darkgrey
:hi cursorColumn cterm=NONE ctermbg=darkred ctermfg=white
:nnoremap <Leader>C :set cursorline! cursorcolumn!<CR>
set cursorline
