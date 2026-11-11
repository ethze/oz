" =============================================================
"  .vimrc - server friendly, all-in-one (no plugins, embedded theme)
"  Theme: 256_noir by Andreas van Cranenburgh
"         https://github.com/andreasvc/vim-256noir/
" =============================================================

" ---------- Basic ----------
set nocompatible                " do not behave like vi
filetype plugin indent on       " per-language filetype detection + indent
if !exists('g:syntax_on')
  syntax enable                 " syntax highlighting
endif
set encoding=utf-8
set fileencoding=utf-8
set hidden                      " switch buffers without saving first
set updatetime=300
set ttimeout
set ttimeoutlen=50              " snappy ESC / jk (important over SSH)
set timeoutlen=500              " mapping wait time (jk, <leader>e)
set lazyredraw                  " lighter on slow connections
set ttyfast
set backspace=indent,eol,start  " sane backspace
set mouse=a                     " mouse support (disable with: set mouse=)
if has('clipboard')
  set clipboard=unnamed         " use system clipboard when available
endif

" ---------- Leader key ----------
let mapleader = " "
let maplocalleader = " "

" ---------- UI ----------
set number                      " line numbers
set relativenumber              " relative numbers (great for 5j, 10k, etc.)
set cursorline                  " highlight current line
set ruler
set showcmd
set showmode
set laststatus=2                " always show statusline
set wildmenu                    " command-line autocomplete
set wildmode=longest:full,full
set scrolloff=8                 " lines kept above/below cursor
set sidescrolloff=8
set signcolumn=no
set nowrap                      " do not wrap long lines
set linebreak
set showmatch                   " highlight matching brackets
set colorcolumn=100             " column limit guide
set list                        " show hidden characters
set listchars=tab:»·,trail:·,nbsp:␣
if has('termguicolors') && $COLORTERM =~# 'truecolor\|24bit'
  set termguicolors
endif
if &t_Co < 256 && !has('gui_running') && $TERM =~# '256color'
  set t_Co=256                  " force 256 colors if the terminal supports it
endif

" Simple statusline
set statusline=%F\ %m%r%h%w%=%y\ [%{&fileencoding?&fileencoding:&encoding}]\ [%{&ff}]\ %l:%c\ %p%%

" ---------- Colorscheme: 256_noir (embedded) ----------
" Dark background, numbers & errors in red, everything else in shades of gray.
" Colors 232--250 are grays from dark to light, 16 = black, 255 = white,
" 196 = red, 88 = dark red.
highlight clear
set background=dark
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "256_noir"

if has("gui_running") || &t_Co == 256
  hi Normal cterm=NONE ctermfg=250 ctermbg=16 gui=NONE guifg=#bcbcbc guibg=#000000
  hi Keyword cterm=NONE ctermfg=255 ctermbg=16 gui=NONE guifg=#eeeeee guibg=#000000
  hi Constant cterm=NONE ctermfg=252 ctermbg=16 gui=NONE guifg=#d0d0d0 guibg=#000000
  hi String cterm=NONE ctermfg=245 ctermbg=16 gui=NONE guifg=#8a8a8a guibg=#000000
  hi Comment cterm=NONE ctermfg=240 ctermbg=16 gui=NONE guifg=#585858 guibg=#000000
  hi Number cterm=NONE ctermfg=196 ctermbg=16 gui=NONE guifg=#ff0000 guibg=#000000
  hi Error cterm=NONE ctermfg=255 ctermbg=88 gui=NONE guifg=#eeeeee guibg=#870000
  hi ErrorMsg cterm=NONE ctermfg=255 ctermbg=124 gui=NONE guifg=#eeeeee guibg=#af0000
  hi Search cterm=NONE ctermfg=245 ctermbg=236 gui=NONE guifg=#8a8a8a guibg=#303030
  hi IncSearch cterm=reverse ctermfg=255 ctermbg=245 gui=reverse guifg=#eeeeee guibg=#8a8a8a
  hi DiffChange cterm=NONE ctermfg=160 ctermbg=255 gui=NONE guifg=#d70000 guibg=#eeeeee
  hi DiffText cterm=bold ctermfg=250 ctermbg=196 gui=bold guifg=#bcbcbc guibg=#ff0000
  hi SignColumn cterm=NONE ctermfg=124 ctermbg=240 gui=NONE guifg=#af0000 guibg=#585858
  hi SpellBad cterm=undercurl ctermfg=255 ctermbg=88 gui=undercurl guifg=#eeeeee guibg=#870000
  hi SpellCap cterm=NONE ctermfg=255 ctermbg=124 gui=NONE guifg=#eeeeee guibg=#af0000
  hi SpellRare cterm=NONE ctermfg=124 ctermbg=16 gui=NONE guifg=#af0000 guibg=#000000
  hi WildMenu cterm=NONE ctermfg=240 ctermbg=255 gui=NONE guifg=#585858 guibg=#eeeeee
  hi Pmenu cterm=NONE ctermfg=255 ctermbg=240 gui=NONE guifg=#eeeeee guibg=#585858
  hi PmenuThumb cterm=NONE ctermfg=232 ctermbg=240 gui=NONE guifg=#080808 guibg=#585858
  hi SpecialKey cterm=NONE ctermfg=16 ctermbg=255 gui=NONE guifg=#000000 guibg=#eeeeee
  hi MatchParen cterm=NONE ctermfg=16 ctermbg=240 gui=NONE guifg=#000000 guibg=#585858
  hi CursorLine cterm=NONE ctermfg=NONE ctermbg=233 gui=NONE guifg=NONE guibg=#121212
  hi StatusLine cterm=bold,reverse ctermfg=245 ctermbg=16 gui=bold,reverse guifg=#8a8a8a guibg=#000000
  hi StatusLineNC cterm=reverse ctermfg=236 ctermbg=16 gui=reverse guifg=#303030 guibg=#000000
  hi Visual cterm=reverse ctermfg=250 ctermbg=16 gui=reverse guifg=#bcbcbc guibg=#000000
  hi TermCursor cterm=reverse ctermfg=NONE ctermbg=NONE gui=reverse guifg=NONE guibg=NONE
else
  hi Normal cterm=NONE ctermfg=Gray ctermbg=Black
  hi Keyword cterm=NONE ctermfg=White ctermbg=Black
  hi Constant cterm=NONE ctermfg=Gray ctermbg=Black
  hi String cterm=NONE ctermfg=Gray ctermbg=Black
  hi Comment cterm=NONE ctermfg=DarkGray ctermbg=Black
  hi Number cterm=NONE ctermfg=Red ctermbg=Black
  hi Error cterm=NONE ctermfg=White ctermbg=DarkRed
  hi ErrorMsg cterm=NONE ctermfg=White ctermbg=Red
  hi Search cterm=NONE ctermfg=Gray ctermbg=DarkGray
  hi IncSearch cterm=reverse ctermfg=White ctermbg=Gray
  hi DiffChange cterm=NONE ctermfg=Red ctermbg=White
  hi DiffText cterm=bold ctermfg=Gray ctermbg=Red
  hi SignColumn cterm=NONE ctermfg=Red ctermbg=DarkGray
  hi SpellBad cterm=undercurl ctermfg=White ctermbg=DarkRed
  hi SpellCap cterm=NONE ctermfg=White ctermbg=Red
  hi SpellRare cterm=NONE ctermfg=Red ctermbg=Black
  hi WildMenu cterm=NONE ctermfg=DarkGray ctermbg=White
  hi Pmenu cterm=NONE ctermfg=White ctermbg=DarkGray
  hi PmenuThumb cterm=NONE ctermfg=Black ctermbg=DarkGray
  hi SpecialKey cterm=NONE ctermfg=Black ctermbg=White
  hi MatchParen cterm=NONE ctermfg=Black ctermbg=DarkGray
  hi CursorLine cterm=NONE ctermfg=NONE ctermbg=Black
  hi StatusLine cterm=bold,reverse ctermfg=Gray ctermbg=Black
  hi StatusLineNC cterm=reverse ctermfg=DarkGray ctermbg=Black
  hi Visual cterm=reverse ctermfg=Gray ctermbg=Black
  hi TermCursor cterm=reverse ctermfg=NONE ctermbg=NONE
endif

highlight! link Boolean Normal
highlight! link Delimiter Normal
highlight! link Identifier Normal
highlight! link Title Normal
highlight! link Debug Normal
highlight! link Exception Normal
highlight! link FoldColumn Normal
highlight! link Macro Normal
highlight! link ModeMsg Normal
highlight! link MoreMsg Normal
highlight! link Question Normal
highlight! link Conditional Keyword
highlight! link Statement Keyword
highlight! link Operator Keyword
highlight! link Structure Keyword
highlight! link Function Keyword
highlight! link Include Keyword
highlight! link Type Keyword
highlight! link Typedef Keyword
highlight! link Todo Keyword
highlight! link Label Keyword
highlight! link Define Keyword
highlight! link DiffAdd Keyword
highlight! link diffAdded Keyword
highlight! link diffCommon Keyword
highlight! link Directory Keyword
highlight! link PreCondit Keyword
highlight! link PreProc Keyword
highlight! link Repeat Keyword
highlight! link Special Keyword
highlight! link SpecialChar Keyword
highlight! link StorageClass Keyword
highlight! link SpecialComment String
highlight! link CursorLineNr String
highlight! link Character Number
highlight! link Float Number
highlight! link Tag String
highlight! link Folded Number
highlight! link WarningMsg Number
highlight! link iCursor SpecialKey
highlight! link SpellLocal SpellCap
highlight! link LineNr Comment
highlight! link NonText Comment
highlight! link DiffDelete Comment
highlight! link diffRemoved Comment
highlight! link PmenuSbar Visual
highlight! link PmenuSel Visual
highlight! link VisualNOS Visual
highlight! link VertSplit Visual
highlight! link Cursor StatusLine
highlight! link Underlined SpellRare
highlight! link rstEmphasis SpellRare
highlight! link diffChanged DiffChange

" Extras: groups the original theme does not define
if has("gui_running") || &t_Co == 256
  hi ColorColumn cterm=NONE ctermbg=233 guibg=#121212
  hi CursorLineNr cterm=bold ctermfg=255 guifg=#eeeeee
  hi Whitespace ctermfg=236 guifg=#303030
  hi NonText ctermfg=238 guifg=#444444
  hi SpecialKey cterm=NONE ctermfg=238 ctermbg=NONE guifg=#444444 guibg=NONE
else
  hi ColorColumn cterm=NONE ctermbg=DarkGray
endif

" ---------- Indentation ----------
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab                   " tabs become spaces
set autoindent
set smartindent
set shiftround

" Per-language overrides
augroup filetype_indent
  autocmd!
  autocmd FileType yaml,yml,json,html,css,javascript,typescript,sh,lua,vim setlocal tabstop=2 shiftwidth=2 softtabstop=2
  autocmd FileType make setlocal noexpandtab tabstop=8 shiftwidth=8
  autocmd FileType go setlocal noexpandtab tabstop=4 shiftwidth=4
augroup END

" ---------- Search ----------
set incsearch                   " search as you type
set hlsearch                    " highlight matches
set ignorecase
set smartcase                   " case sensitive if the pattern has uppercase

" ---------- Backup, swap, undo (kept tidy under ~/.vim) ----------
let s:vimdir = expand('~/.vim')
for s:d in ['backup', 'swap', 'undo']
  if !isdirectory(s:vimdir . '/' . s:d)
    silent! call mkdir(s:vimdir . '/' . s:d, 'p', 0700)
  endif
endfor
set backup
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
if has('persistent_undo')
  set undofile
  set undodir=~/.vim/undo//
endif

" ---------- Auto reload when a file changes outside vim ----------
set autoread
augroup autoread_files
  autocmd!
  autocmd FocusGained,BufEnter,CursorHold * silent! checktime
augroup END

" ---------- Reopen files at the last cursor position ----------
augroup last_position
  autocmd!
  autocmd BufReadPost *
        \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
        \ |   exe "normal! g`\""
        \ | endif
augroup END

" ---------- Strip trailing whitespace on save ----------
function! s:TrimWhitespace()
  let l:view = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:view)
endfunction
augroup trim_ws
  autocmd!
  autocmd BufWritePre * if &ft !~# 'markdown\|diff' | call s:TrimWhitespace() | endif
augroup END

" ---------- Keymaps ----------
" jk = leave insert mode (back to normal mode)
inoremap jk <Esc>
cnoremap jk <C-c>
vnoremap jk <Esc>

" Space + e = toggle the built-in file explorer (netrw) as a left sidebar
nnoremap <silent> <leader>e :Lexplore<CR>

" Quick save / quit
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>Q :qa!<CR>

" Clear search highlight
nnoremap <silent> <leader>h :nohlsearch<CR>

" Window navigation: Ctrl + h/j/k/l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Buffer navigation
nnoremap <silent> <S-l> :bnext<CR>
nnoremap <silent> <S-h> :bprevious<CR>
nnoremap <silent> <leader>x :bdelete<CR>

" Move by visual line when wrapping is on
nnoremap j gj
nnoremap k gk

" Y = yank to end of line (consistent with D and C)
nnoremap Y y$

" Stay in visual mode after indenting
vnoremap < <gv
vnoremap > >gv

" Move selected lines up/down in visual mode: J / K
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Keep search results centered
nnoremap n nzzzv
nnoremap N Nzzzv

" Save with sudo if you forgot to open the file as root
cnoremap w!! w !sudo tee % >/dev/null<CR>

" Paste mode toggle (paste over SSH without auto-indent mess)
set pastetoggle=<F2>

" ---------- Netrw (built-in file explorer) ----------
let g:netrw_banner = 0          " hide the banner
let g:netrw_liststyle = 3       " tree view
let g:netrw_browse_split = 4    " open files in the previous window
let g:netrw_altv = 1
let g:netrw_winsize = 25        " sidebar width (25%)
let g:netrw_keepdir = 0
let g:netrw_localcopydircmd = 'cp -r'
