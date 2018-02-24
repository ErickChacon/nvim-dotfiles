" testitexn"
" Neovim settings
" Language:	Vim
" Last Change:	22 Jun 2017
"
" PLUGINS {{{
call plug#begin('~/.local/share/nvim/plugged')

" Colorschemes
Plug 'morhetz/gruvbox'
Plug 'sickill/vim-monokai'
Plug 'ajh17/Spacegray.vim'
Plug 'icymind/NeoSolarized'
Plug 'mhartington/oceanic-next'
Plug 'KeitaNakamura/neodark.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'MaxSt/FlatColor'
Plug 'joshdick/onedark.vim'
Plug 'nightsense/vim-crunchbang'
Plug 'exitface/synthwave.vim'
Plug 'YorickPeterse/happy_hacking.vim'
Plug 'gilgigilgil/anderson.vim'
Plug 'jdkanani/vim-material-theme'
Plug 'jeetsukumaran/vim-nefertiti'
Plug 'dracula/vim'
Plug 'mhinz/vim-janah'
Plug 'jdsimcoe/abstract.vim'
Plug 'AlessandroYorba/Alduin'
Plug 'zacanger/angr.vim'
Plug 'tyrannicaltoucan/vim-deep-space'
Plug 'w0ng/vim-hybrid'
Plug 'nanotech/jellybeans.vim'
Plug 'cseelus/vim-colors-lucid'
Plug 'rakr/vim-one'
Plug 'liuchengxu/space-vim-dark'
Plug 'jacoborus/tender.vim'
Plug 'rakr/vim-two-firewatch'
Plug 'roosta/srcery'
Plug 'nightsense/stellarized'
Plug 'ajmwagar/vim-deus'
Plug 'sonph/onehalf', {'rtp': 'vim/'}

" Explore folder and documents
Plug 'ctrlpvim/ctrlp.vim' " find files
Plug 'scrooloose/nerdtree' " explore your filesystem and to open files
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim' " fuzzy matching

" Development environment tools
" Plug 'epeli/slimux' " not using with r but maybe with python
" Plug 'kassio/neoterm' " use terminal
Plug 'jalvesaq/vimcmdline' " command line
Plug 'hkupty/iron.nvim' " Interactive Repls Over Neovim
Plug 'SirVer/ultisnips' " snippets
Plug 'honza/vim-snippets' " snippets scripts
" Plug 'roxma/nvim-completion-manager'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " completion
" Plug 'autozimu/LanguageClient-neovim', {
"     \ 'branch': 'next',
"     \ 'do': 'bash install.sh',
"     \ }

if !exists("g:gui_oni")
  " Plug 'vim-airline/vim-airline' " status and tab lines
  " Plug 'vim-airline/vim-airline-themes'
  Plug 'itchyny/lightline.vim' " status and tab lines
endif
Plug 'ryanoasis/vim-devicons' " filetype icons
Plug 'kshenoy/vim-signature' " display marks
Plug 'majutsushi/tagbar' " display tags
Plug 'ap/vim-css-color'
Plug 'ntpeters/vim-better-whitespace'
" Plug 'edkolev/tmuxline.vim'
" Plug 'weihanglo/tmuxline.vim'
Plug 'CPWeaver/tmuxline.vim'
Plug 'christoomey/vim-tmux-navigator'

" Programs
Plug 'vimwiki/vimwiki' " vimwiki: notes and agenda
Plug 'lervag/vimtex' " latex
Plug 'vim-pandoc/vim-pandoc-syntax' " markdown: great works with nvim-r
Plug 'vim-pandoc/vim-pandoc' " markdown: really nice for markdown
function! BuildComposer(info) " markdown preview
  if a:info.status != 'unchanged' || a:info.force
    !cargo build --release
  endif
endfunction
Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }
" Plug 'suan/vim-instant-markdown' " does not work
Plug 'cespare/vim-toml' " toml: syntax highlight
Plug 'jalvesaq/Nvim-R' " R: run code, rmarkdown, help and more
" Plug 'jalvesaq/Nvim-R', {'commit': '511ac10'} " R: run code, rmarkdown, help and more
Plug 'tpope/vim-fugitive' " git: wrapper
Plug 'airblade/vim-gitgutter' " git: shows added and remove lines of git
" Plug 'ivanov/vim-ipython' " Python: two-way integration with ipython
" Plug 'bfredl/nvim-ipy' " Python: jupyter front-end for neovim
" Plug 'zchee/deoplete-jedi' " Python: autocomplete
Plug 'vim-python/python-syntax' " Python: syntax highlighting
" Plug 'KeitaNakamura/highlighter.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'JuliaEditorSupport/julia-vim'
" Plug 'JuliaEditorSupport/deoplete-julia' " initialize problem

" Motions
Plug 'tpope/vim-surround' " sorround
Plug 'kana/vim-textobj-indent' " copy indented block
Plug 'kana/vim-textobj-user' " custom text object
Plug 'tomtom/tcomment_vim' " easy comment
Plug 'scrooloose/nerdcommenter'
Plug 'godlygeek/tabular'

call plug#end()
" }}}
" GENERAL SETTING {{{

" syntax enable
" let mapleader = " " " Leader - ( Spacebar ) \ by default
let maplocalleader = "\\"
set backspace=2 " Backspace deletes like most programs in insert mode
set nobackup " avoid create backup automatically
set nowritebackup " save: avoid new-delete-rename
set history=50 " history of the last commands
set ruler " row and column position
set encoding=utf-8 " Necessary to show Unicode glyphs
set autowrite     " Automatically :write before running commands
set autoread      " Reload files changed outside vim
au FocusGained,BufEnter * :silent! " Check if file has changed externally
set showmatch " Show matching brackets just for a moment.
set title " window title

if exists("g:gui_oni")
  " Turn off statusbar, because it is externalized
  set noruler
  set laststatus=0 " 2: Always display the status line
  set noshowcmd
  set noshowmode " hide the default status mode
else
  set laststatus=2 " 2: Always display the status line
endif

set number " show line number
set numberwidth=4
set relativenumber

set hlsearch "highlight searches
set incsearch    " search as characters are entered
set ignorecase    " case insensitive searching (unless specified)
set smartcase
nnoremap <silent> <leader>, :noh<cr> " Stop highlight after searching

set shiftwidth=2
set softtabstop=2   " number of spaces in tab when editing
set expandtab       " tabs are spaces
" set showcmd         " show incomplete command in bottom bar
set cursorline      " highlight current line
set visualbell      " stop the annoying beeping
filetype indent on  " load filetype-specific indent files R,
filetype plugin on " for markdown preview
set wildmenu        " nice visual autocomplete for command menu
set wildmode=list:longest,full " full menu
set lazyredraw          " redraw only when we need to.
" set showmatch           " highlight matching [{()}]
set clipboard=unnamedplus " copy to clipboard

"Allow usage of mouse in iTerm
set ttyfast
set mouse=a

" Make it obvious where 100 characters is
set textwidth=85
set formatoptions=cqt " it changes depending of the filetype
" set wrapmargin=0
 " set formatoptions=cq
" set formatoptions=qrn1
" set wrapmargin=0
set colorcolumn=+1
" let &colorcolumn="10,".join(range(70,999),",")
let &colorcolumn="".join(range(91,999),",")
" let &colorcolumn=range(86,999)
" highlight ColorColumn ctermbg=0 guibg=lightgrey
" augroup vimrc_autocmds
"   autocmd BufEnter * highlight OverLength ctermbg=darkgrey guibg=#592929
"   autocmd BufEnter * match OverLength /\%50v.*/
" augroup END
" Highlight long lines (>80)
" }}}
" ADDITIONAL NVIM SETTING {{{
" to get out of terminal insert mode
tnoremap jk <C-\><C-n>

" Go to the last cursor location when a file is opened, unless this is a
" git commit (in which case it's annoying)
au BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") && &filetype != "gitcommit" |
      \ execute("normal `\"") |
  \ endif


ino " ""<left>
autocmd FileType r,python inoremap ' ''<left>
ino ( ()<left>
ino [ []<left>
ino { {}<left>
autocmd FileType tex inoremap $ $$<left>
ino {<CR> {<CR>}<ESC>O


" Disable Arrow keys in Escape mode
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Disable Arrow keys in Insert mode
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>

" Mapping esc to jk and disable the old key
inoremap jk <Esc>
inoremap <esc> <nop>

vnoremap jk <Esc>
" vnoremap jk <Esc>gV
" inoremap jk <Esc>
" inoremap <esc> <nop>

" Use ctrl-[hjkl] to select the active split!
" nmap <silent> <c-k> :wincmd k<CR>
" nmap <silent> <c-j> :wincmd j<CR>
" nmap <silent> <c-h> :wincmd h<CR>
" nmap <silent> <c-l> :wincmd l<CR>
nmap <silent> gk :wincmd k<CR>
nmap <silent> gj :wincmd j<CR>
nmap <silent> gh :wincmd h<CR>
nmap <silent> gl :wincmd l<CR>

" Forcing vimdiff to wrap lines
autocmd FilterWritePre * if &diff | setlocal wrap< | endif

" }}}
" COLORSCHEME {{{
" Colorscheme vim options
set termguicolors
syntax enable " allow syntax colors

if exists("g:gui_oni")
  " set background=light " incompatible with colorscheme
  set background=dark " incompatible with colorscheme
else
  set background=dark " incompatible with colorscheme
endif
" set background=light " incompatible with colorscheme

" Gruvbox colorscheme
let g:gruvbox_italic = 1
let g:gruvbox_italicize_strings = 1
let g:gruvbox_italicize_comments = 1
let g:gruvbox_contrast_dark = "soft"
let g:gruvbox_contrast_light = "soft"
" let g:gruvbox_color_column = "bg2"
" let g:gruvbox_vert_split='dark0_hard'
" let g:gruvbox_number_column = "red"
" let g:gruvbox_invert_signs = 1

" Nord colorscheme
let g:nord_italic = 1
let g:nord_italic_comments = 1
let g:nord_comment_brightness = 20
let g:nord_statusline_uniform = 0

" Deus colorscheme
let g:deus_bold=0
let g:deus_italic=1

" Neodark colorscheme
" let g:neodark#use_256color = 1


" colorscheme nord
" colorscheme gruvbox
" colorscheme material-theme
" colorscheme deus
" colorscheme neodark " spelling problem
" colorscheme onedark " spelling problem

" let g:one_allow_italics = 1
" colorscheme one
" colorscheme monokai
" colorscheme spacegray
" colorscheme dracula
" colorscheme space-vim-dark
" colorscheme flatcolor
" colorscheme OceanicNext
" colorscheme two-firewatch
" let g:airline_theme='twofirewatch'
" colorscheme srcery
" colorscheme anderson
" colorscheme crunchbang
" colorscheme nefertiti
" colorscheme happy_hacking

" colorscheme NeoSolarized
" colorscheme stellarized_dark
" colorscheme synthwave " spelling problem
" let g:deepspace_italics=1
" colorscheme deep-space
" colorscheme hybrid
" colorscheme alduin
" colorscheme jellybeans
" colorscheme lucid
" colorscheme janah "spelling problem

" colorscheme abstract
" colorscheme tender
" colorscheme angr " spelling problem

let g:nvim_id = system("pgrep -x 'nvim' | sed -n 1p")
" echo g:nvim_id

function! Random()
python3 << EOF
import random
import vim
random.seed(int(vim.eval("g:nvim_id")))
value = random.randrange(1, 5)
vim.command("let g:random_number = %s"% value)
EOF
endfunction

call Random()
" echo g:random_number


if exists("g:gui_oni")
  colorscheme nord
  " colorscheme material-theme
  " colorscheme gruvbox
else
  " if g:random_number == 1
    colorscheme nord
  " elseif g:random_number == 2
  "   colorscheme gruvbox
  " elseif g:random_number == 3
  "   colorscheme material-theme
  " elseif g:random_number == 4
  "   colorscheme deus
  " endif
  " colorscheme onedark " spelling problem
  " colorscheme neodark " spelling problem
endif


" Toggle background colors
" nnoremap <Leader>bg :let &background = ( &background == "dark"? "light" : "dark" )<CR> \| :hi! link FoldColumn GruvboxRed<CR> \| :hi! link Folded GruvboxYellowSign<CR>
nnoremap <Leader>bg :let &background = ( &background == "dark"? "light" : "dark" )<CR> \| :hi! link FoldColumn GruvboxRed<CR>
" }}}
" NVIM TERMINAL {{{
" Neovim terminal emulator colors, based on gruvbox
" let g:terminal_color_0 = '#665c54'
let g:terminal_color_1 = '#fb4934'
let g:terminal_color_2 = '#83a598'
let g:terminal_color_3 = '#d79921'
let g:terminal_color_4 = '#b16286'
let g:terminal_color_5 = '#458588'
let g:terminal_color_6 = '#b8bb26'
let g:terminal_color_7 = '#d65d0e'
let g:terminal_color_8 = '#a89984'
let g:terminal_color_9 = '#fb4934'
let g:terminal_color_10 = '#8ec07c'
let g:terminal_color_11 = '#fabd2f'
let g:terminal_color_12 = '#d3869b'
let g:terminal_color_13 = '#689d6a'
let g:terminal_color_14 = '#98971a'
let g:terminal_color_15 = '#fe8019'
" BACKGROUND_COLOR="#282828"  # Background Color
" FOREGROUND_COLOR="#ebdbb2" # Text
" }}}
" FOLDING {{{
function! MyFoldText() " {{{
    let line = getline(v:foldstart)
    let nucolwidth = &fdc + &number * &numberwidth
    " let windowwidth = winwidth(0) - nucolwidth - 12
    "
     if g:gitgutter_enabled "g:gitgutter_sign_column_always
       " exists('g:loaded_gitgutter') "&cp has('signs')
       let plop = 2
     else
       let plop = 0
     endif

    let windowwidth = winwidth(0) - nucolwidth - 12 - plop
    let foldedlinecount = v:foldend - v:foldstart

    " expand tabs into spaces
    let onetab = strpart('          ', 0, &tabstop)
    let line = substitute(line, '\t', onetab, 'g')

    let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
    let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
    return line . ' ' . repeat(" ",fillcharcount) . '  ➜ ' . foldedlinecount . ' lines ' . '✤ ' "⤵
endfunction " }}}

set foldmethod=marker " for vim
" set foldmethod=syntax
" set foldmethod=expr
set foldtext=MyFoldText()
set foldlevel=1
set foldcolumn=2
" set foldcolumn=1
hi! link FoldColumn Statement
" hi! link FoldColumn GruvboxRed
" hi! link Folded GruvboxYellowSign
" hi! link Folded VimCommentTitle
" }}}
" IDE: AIRLINE PLUGIN STATUS AND TAB LINES {{{
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#left_sep = ' '
" let g:airline#extensions#tabline#right_sep = ' '
" let g:airline#extensions#tabline#left_alt_sep = '|'
" let g:airline#extensions#tabline#right_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_section_x = '%{&filetype}' " to no truncate filetype
let g:airline#extensions#default#section_truncate_width = {
      \ 'b': 60,
      \ 'y': 80,
      \ 'warning': 100,
      \ 'error': 100,
\ }

" let g:airline_left_sep=''
"  let g:airline_right_sep=''

" b: branch
" x: filetype
" y: encoding
" z: number line details
" let g:airline#extensions#default#section_truncate_width = {
"       \ 'b': 79,
"       \ 'x': 20,
"       \ 'y': 20,
"       \ 'z': 45,
"       \ 'warning': 100,
"       \ 'error': 100,
" \ }
" let g:airline_theme='solarized'
" let g:airline_theme='bubblegum'
" let g:airline_theme='base16'
" let g:airline_theme='jellybeans'
" let g:airline_theme='sol'
"
let g:lightline = {}
let g:lightline.colorscheme = 'yourcolorscheme'

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyFiletypeIcon(n)
  return winwidth(0) > 70 ? (strlen(&filetype) ?  WebDevIconsGetFileTypeSymbol() : '') : ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction
function! Lightlinegit()
    let l:branch = fugitive#head()
    return l:branch ==# '' ? '' : "\uE0A0" . " " . l:branch
endfunction
let g:lightline.component = {
      \ 'empty': '',
      \ 'filepath': '%F'}
let g:lightline.component_function = {
      \ 'gitbranch': 'Lightlinegit',
      \ 'filetype': 'MyFiletype',
      \ 'fileformat': 'MyFileformat'
      \ }
let g:lightline.tab_component_function = {
      \ 'filetypeicon': 'MyFiletypeIcon',
      \ }
let g:lightline.active = {
      \ 'left': [ [ 'mode', 'paste' ], ['gitbranch'],
      \           [ 'readonly', 'filename', 'modified' ] ],
      \ 'right': [ [ 'percent' , 'lineinfo' ],
      \            [ 'fileencoding'],
      \           [ 'filetype'] ] }
let g:lightline.inactive = {
      \ 'left': [ [ 'filepath' ] ],
      \ 'right': [ ['empty'] ] }
let g:lightline.tabline = {
      \ 'left': [ [ 'tabs' ] ],
      \ 'right': [ [ 'close' ] ] }
let g:lightline.tab = {
      \ 'active': [ 'tabnum', 'filename', 'filetypeicon', 'modified' ],
      \ 'inactive': [ 'tabnum', 'filename', 'modified' ]
      \ }
let g:lightline.separator = { 'left': "\ue0b0", 'right': '' }
let g:lightline.subseparator = { 'left': '|', 'right': '' }

let s:fg_focus = [ '#ffffff' , "NONE" ]
let s:bg_focus = ["#665C54", "NONE"]
let s:fg_hard = [ '#dfdbd2', "NONE"]
let s:bg_hard = [ '#332927' , "NONE" ]
let s:fg_soft = [ '#dfdbd2', "NONE"]
let s:bg_soft = [ '#3c3836', "NONE"]
let s:bg_visual = [ '#d08770' , "NONE" ]
let s:bg_insert = [ '#BF616A' , "NONE" ]
let s:fg_inactive = [ '#a89984' , "NONE" ]
let s:none = [ 'NONE' , 'NONE' ]

if g:colors_name == 'gruvbox'
  let s:fg_focus = [ '#282828' , "NONE" ]
  let s:bg_focus = ["#a89984", "NONE"]
  let s:fg_hard = [ '#a89984', "NONE"]
  let s:bg_hard = [ '#504945' , "NONE" ]
  let s:fg_soft = [ '#a89984', "NONE"]
  let s:bg_soft = [ '#3c3836', "NONE"]
  let s:bg_visual = [ '#f79375' , "NONE" ]
  let s:bg_insert = [ '#dfdbd2' , "NONE" ]
  let s:fg_inactive = [ '#a89984' , "NONE" ]
  let s:none = [ 'NONE' , 'NONE' ]
endif

if g:colors_name == 'nord'
  let s:fg_focus = [ '#eCEFF4' , "NONE" ]
  let s:bg_focus = ["#5E81AC", "NONE"]
  let s:fg_hard = [ '#d8DEE9', "NONE"]
  let s:bg_hard = [ '#4C566A' , "NONE" ]
  let s:fg_soft = [ '#d8DEE9', "NONE"]
  let s:bg_soft = [ '#3B4252', "NONE"]
  let s:bg_insert = [ '#BF616A' , "NONE" ]
  let s:bg_visual = [ '#d08770' , "NONE" ]
  let s:fg_inactive = [ '#5E81AC' , "NONE" ]
  let s:none = [ 'NONE' , 'NONE' ]
endif

if g:colors_name == 'material-theme'
  let s:fg_focus = [ '#ffffff' , "NONE" ]
  let s:bg_focus = ["#5C7E8C", "NONE"]
  let s:fg_hard = [ '#cDD3DE', "NONE"]
  let s:bg_hard = [ '#4C566A' , "NONE" ]
  let s:fg_soft = [ '#cDD3DE', "NONE"]
  let s:bg_soft = [ '#37474F', "NONE"]
  let s:bg_insert = [ '#BF616A' , "NONE" ]
  let s:bg_visual = [ '#d08770' , "NONE" ]
  let s:fg_inactive = [ '#7986CB' , "NONE" ]
  let s:none = [ 'NONE' , 'NONE' ]
endif

if g:colors_name == 'deus'
  let s:fg_focus = [ '#2C313A' , "NONE" ]
  let s:bg_focus = ["#83a598", "NONE"]
  let s:fg_hard = [ '#ebdbb2', "NONE"]
  let s:bg_hard = [ '#2C313A' , "NONE" ]
  let s:fg_soft = [ '#ebdbb2', "NONE"]
  let s:bg_soft = [ '#3c3836', "NONE"]
  let s:bg_insert = [ '#BF616A' , "NONE" ]
  let s:bg_visual = [ '#d08770' , "NONE" ]
  let s:fg_inactive = [ '#928374' , "NONE" ]
  let s:none = [ 'NONE' , 'NONE' ]
endif


let s:p = {'normal': {}, 'tabline': {}, 'insert':{}, 'visual':{}, 'inactive':{}}
let s:p.normal.left = [
      \ [ s:fg_focus, s:bg_focus, 'bold' ],
      \ [ s:fg_hard, s:bg_hard ],
      \]
let s:p.normal.middle = [
      \ [ s:fg_soft, s:bg_soft ] ]
let s:p.normal.right = [
      \ [ s:fg_focus, s:bg_focus, 'bold' ],
      \ [ s:fg_hard, s:bg_hard ],
      \ [ s:fg_soft, s:bg_soft ] ]
let s:p.tabline.left = [ [ s:fg_hard, s:bg_hard ] ]
let s:p.tabline.tabsel = [ [ s:fg_focus, s:bg_focus ] ]
let s:p.tabline.middle = [ [ s:fg_soft, s:bg_soft ] ]
let s:p.insert.left = [
      \ [ s:fg_focus, s:bg_insert, 'bold' ],
      \ [ s:fg_hard, s:bg_hard ]
      \ ]
let s:p.insert.right = [
      \ [ s:fg_focus, s:bg_insert, 'bold' ],
      \ [ s:fg_hard, s:bg_hard ]
      \ ]
let s:p.visual.left = [
      \ [ s:fg_focus, s:bg_visual, 'bold' ],
      \ [ s:fg_hard, s:bg_hard ]
      \ ]
let s:p.visual.right = [
      \ [ s:fg_focus, s:bg_visual, 'bold' ],
      \ [ s:fg_hard, s:bg_hard ]
      \ ]
let s:p.inactive.left = [ [ s:fg_inactive, s:bg_soft, 'italic' ], [ s:fg_inactive, s:bg_soft ] ]
let s:p.inactive.right = [ [ s:fg_inactive, s:bg_soft], [ s:fg_inactive, s:bg_soft ] ]
let s:p.inactive.middle = [ [ s:fg_inactive, s:bg_soft ] ]

let g:lightline#colorscheme#yourcolorscheme#palette = lightline#colorscheme#flatten(s:p)

" }}}
" IDE: TMUXLINE {{{

" Tmuxline does not work automatically without airline.
" let g:airline#extensions#tmuxline#enabled = 0
" Preset can be configure with:
" let g:tmuxline_powerline_separators = 0
let g:tmuxline_separators = {
    \ 'left' : '',
    \ 'left_alt': '',
    \ 'right' : '',
    \ 'right_alt' : '',
    \ 'space' : ' '}
let g:tmuxline_preset = {
      \'a'    : '#S',
      \'win'  : ['#I:#W'],
      \'cwin' : ['#I:#W ✔'],
      \'x'    : '',
      \'y'    : ['%Y-%m-%d'],
      \'z'    : ['$USER ' . '\uF080' . ' '],
      \'options' : {'status-justify' : 'left'}}
let g:tmuxline_theme = {
      \'a'    : [ s:fg_focus[0], s:bg_focus[0], 'bold'],
      \'b'    : [ s:fg_soft[0], s:bg_soft[0] ],
      \'bg'   : [ s:fg_soft[0], s:bg_soft[0] ],
      \'c'    : [ s:fg_soft[0], s:bg_soft[0] ],
      \'win'  : [ s:fg_soft[0], s:bg_soft[0] ],
      \'cwin' : [ s:fg_hard[0], s:bg_hard[0] ],
      \'x'   : [ s:fg_soft[0], s:bg_soft[0] ],
      \'y'   : [ s:fg_hard[0], s:bg_hard[0] ],
      \'z'    : [ s:fg_focus[0], s:bg_focus[0], 'bold'] }
"  It can be activated with:
if exists('$TMUX')
    autocmd VimEnter * call tmuxline#set_statusline()
endif
" }}}
" IDE: NERDTREE PLUGIN {{{
" :nmap \n :NERDTreeToggle<CR>
set splitright
map <leader>n :NERDTreeToggle<CR>
let NERDTreeMapOpenInTab='T'
let NERDTreeMapOpenInTabSilent='t'
" hi def link NERDTreeOpenable Directory
" }}}
" IDE: DEOPLETE PLUGIN {{{
let g:deoplete#enable_at_startup = 1
" let g:deoplete#complete_method = "omnifunc"
" let g:deoplete#sources = {}
" let g:deoplete#sources._ = ['buffer', 'member', 'tag', 'file', 'omni', 'dictionary', 'around']
" }}}
" IDE: ULTISNIPPETS PLUGIN {{{
" If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsEditSplit="context"
let g:UltiSnipsSnippetsDir=$HOME.'/Documents/Nvim/UltiSnips' " where to create my snippets
let g:UltiSnipsSnippetDirectories=["UltiSnips", $HOME.'/Documents/Nvim/UltiSnips'] " It is necessary to define defaults snippets and your directory
" Add markdown snippets to vimwiki buffer
" inoremap <silent><buffer> <expr><Right> pumvisible() ? deoplete#close_popup() : "<CR>"
let g:UltiSnipsExpandTrigger="nop"
function! s:expand_snippet_or_key(key) abort
  let g:ulti_expand_or_jump_res = 0
  let snippet = UltiSnips#ExpandSnippetOrJump()
  " return snippet
  return (g:ulti_expand_or_jump_res > 0) ? snippet : a:key
endfunction
inoremap <silent> <expr> <CR> pumvisible() ? "<C-y><C-R>=UltiSnips#ExpandSnippet()<CR>" : "\<CR>"
inoremap <silent> <expr> <TAB> pumvisible() ? "\<C-n>" : "<C-R>=<SID>expand_snippet_or_key(\"\t\")<CR>"

" inoremap <silent><expr> <TAB>
" 		\ pumvisible() ? "\<C-n>" :
" 		\ <SID>check_back_space() ? "\<TAB>" :
" 		\ deoplete#mappings#manual_complete()
" 		function! s:check_back_space() abort "{{{
" 		let col = col('.') - 1
" 		return !col || getline('.')[col - 1]  =~ '\s'
" endfunction"}}}
au FileType vimwiki :UltiSnipsAddFiletypes markdown
au FileType vimwiki set syntax=pandoc
" }}}
" IDE: SLIMUX PLUGIN {{{
" nmap <C-c><C-c> :SlimuxREPLSendBuffer<CR>
" nmap <C-j> V:SlimuxREPLSendLine<CR>j
" vmap <C-j> :SlimuxREPLSendLine<CR>
" cmap <C-j> SlimuxREPLSendLine<cr> " console
" vmap <C-s> :SlimuxREPLSendSelection<CR>
" " map <C-c>r :exe "SlimuxShellRun source('" . expand("%:p") . "')"<CR>
" " map \fn <C-R>=expand("%:t:r")<CR>
" " '+ exe ":normal i" . expand("%:t")'
" " map <C-c>r :SlimuxShellRun ls() . expand("%:h")<CR>
" " doeswork = expand("%:h") . ".bak"
" "
" " }}}
" IDE: TAGS {{{
" tags
let g:tagbar_type_r = {
    \ 'ctagstype' : 'r',
    \ 'kinds'     : [
        \ 'f:Functions',
        \ 'g:GlobalVariables',
        \ 'v:FunctionVariables',
    \ ]
\ }
" }}}
" IDE: VIMCMDLINE {{{
let cmdline_app           = {}
let cmdline_app["python"] = "ipython"
let cmdline_in_buffer          = 0      " Start the interpreter in a Neovim buffer
" let cmdline_external_term_cmd = "gnome-terminal -e '%s'"
" let cmdline_external_term_cmd = "xterm -e '%s' &"
" }}}
" IDE: LANGUAGE SERVER PROTOCOL {{{
" set hidden
"     " \ 'r': ['R', '--quiet', '--slave', '-e', 'languageserver::run()'],
"     " \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
" let g:LanguageClient_serverCommands = {
"     \ 'rust': ['rustup', 'run', 'stable', 'rls'],
"     \ 'javascript': ['javascript-typescript-stdio'],
"     \ 'javascript.jsx': ['javascript-typescript-stdio'],
"     \ 'cpp': ['clangd'],
"     \ }
" let g:LanguageClient_autoStart = 0
" let g:LanguageClient_trace = 'verbose'
" nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
" nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
" nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
" let g:LanguageClient_loggingLevel = 'DEBUG'
" " }}}
" VISUAL: DEVICONS {{{
" vim-devisons
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Nerd\ Font\ Complete\ 16
" set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Nerd\ Font\ Complete\ 14
" set guifont=Ubuntu\ Mono \derivative\ Powerline\ 16
" set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types\ 11
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {} " needed
" let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['r'] = '★'
" let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['r'] = 'Ⓡ'
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['r'] = 'ℝ'
" let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['r'] = '☯'
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['stan'] = 'Ⓢ'
" let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['r'] = '★ ♨ ☢ '
" let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['r'] = ''
" }}}
" VISUAL: INDENTLINE PLUGIN {{{
" indentline to exclude tex files
let g:indentLine_fileTypeExclude = ['tex', 'markdown', 'pandoc']
" }}}
" VISUAL: NEOVIM ADDITIONAL OPTIONS {{{

" Change the vertical split appareance
" hi LineNr guibg=bg
" set foldcolumn=2
" hi foldcolumn guibg=bg
" hi VertSplit guibg=bg3 guifg=bg3
set fillchars+=vert:\│
" hi clear VertSplit
" hi! link VertSplit Comment
" hi VertSplit guibg=NONE
" hi VertSplit guibg=NONE guifg=black
hi VertSplit guibg=NONE guifg=#1d2021 gui=none
" hi VertSplit	guibg=black guifg=grey50 gui=none
" hi VertSplit guibg=NONE guifg=['#1d2021', 234]
" let g:gruvbox_vert_split='faded_red'
" hi VertSplit guibg=none
" hi VertSplit guifg=none
" hi! link VertSplit GruvboxPurpleSign
" guifg=GruvboxPurple guibg=GruvboxPurple
"


" }}}
" EXPLORE: CONTROL-P PLUGIN {{{
" let g:ctrlp_map = '<c-p>'
" let g:ctrlp_cmd = 'CtrlP'
" let g:ctrlp_working_path_mode = 'ra'
" }}}
" EXPLORE: NERDTREE {{{
" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg)
exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guifg='. a:guifg
exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

" call NERDTreeHighlightFile('R', 'none', 'none', '#fb4934')
" call NERDTreeHighlightFile('rmd', 'blue', 'none', '#458588', '#458588')
" call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
" call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
" " call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
" call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
" call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
" call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
" call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
" call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
" call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
" call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
" call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
" call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
" call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
" call NERDTreeHighlightFile('ds_store', 'Gray', 'none', '#686868', '#151515')
" call NERDTreeHighlightFile('gitconfig', 'Gray', 'none', '#686868', '#151515')
" call NERDTreeHighlightFile('gitignore', 'Gray', 'none', '#686868', '#151515')
" call NERDTreeHighlightFile('bashrc', 'Gray', 'none', '#686868', '#151515')
" call NERDTreeHighlightFile('bashprofile', 'Gray', 'none', '#686868', '#151515')
" }}}
" PROGRAMS: R {{{
" let r_syntax_folding = 1 " need improves foolding
" to highlight r code in rmd
" let rrst_syn_hl_chunk = 1
let rmd_syn_hl_chunk = 1 " to highlight the fisrt line
" It is only required if vim-pandoc is not installed
" augroup pandoc_syntax
"       au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
" augroup END
" augroup pandoc_syntax
"       au! BufNewFile,BufFilePre,BufRead *.wiki set filetype=markdown.pandoc
" augroup END
let g:pandoc#syntax#codeblocks#embeds#langs = ["cpp", "r", "bash=sh"]
" let g:pandoc#folding#fold_fenced_codeblocks = 1
" let g:pandoc#folding#fdc = 0
" let g:pandoc#syntax#style#underline_special = 1
let g:pandoc#syntax#conceal#use = 1 " pretty highlight
" autocmd FileType * setlocal conceallevel=0

let hostname = substitute(system('hostname'), '\n', '', '')
if hostname == "chaconmo-ThinkPad-L470-W10DG"
  let R_in_buffer = 0 " 0 to not open in an nvim external terminal emulator
elseif hostname == "chaconmo-Precision-5510"
  if exists("g:gui_oni")
    let R_in_buffer = 1 " 0 to not open in an nvim external terminal emulator
  else
    let R_in_buffer = 0 " 0 to not open in an nvim external terminal emulator
  endif
  " Open R in a tmux split
  let R_applescript = 0
  let R_tmux_split = 1
endif

" Open R in an external tmux terminal
" let R_in_buffer = 0 " 0 to not open in an nvim external terminal emulator
" Other tmux options
let R_tmux_title = "automatic" " tmux window names
let R_objbr_place = "script,right"
" Shortcuts
let R_assign = 0
" Splits distribution
" let R_editor_w = 30
" let R_rconsole_width = 86
let R_rconsole_height = 10
" let R_rconsole_width = 0
" Functions arguments
" let R_show_args = 1 " show arguments in a new pane after omnicompletion
" let R_show_arg_help = 1 " show arguments help after completion
let R_args_in_stline = 1 " show arguments on the status line
" Markdown options
let R_openhtml = 1
let R_pdfviewer = "evince"
" Highlighting
" let R_start_libs = "base,stats,graphics,grDevices,utils,methods"
" let R_hi_fun = 0 " 0 to not Highlight functions, problem with ROnJobStdout
let R_hi_fun_paren = 1 " only highlight if ( is typed
" }}}
" PROGRAMS: LATEX {{{
let g:airline#extensions#vimtex#enabled = 0 " unable extension because is failing
" Recoganize tex as latex
let g:tex_flavor = 'tex'
" let g:vimtex_toc_number_width = -1
let g:vimtex_toc_secnumdepth=0
" let g:vimtex_index_resize=1
let g:vimtex_index_split_width=40
let g:vimtex_index_split_pos = "vertical botright"
" Latex shortcuts
" nnoremap <localleader>lt :VimtexTocOpen<CR>
nnoremap <localleader>lt :VimtexTocToggle<CR>
nnoremap <localleader>lv :VimtexView<CR>
nnoremap <localleader>ll :VimtexCompile<CR>
nnoremap <localleader>lo :VimtexCompileSS<CR>
nnoremap <localleader>le :VimtexErrors<CR>
nnoremap <localleader>lc :VimtexClean<CR>
let g:tex_conceal="abdmg"
" let g:tex_conceal=""
" let g:tex_fast= "bcmprsSvV"
" let g:tex_fast= "b"
" let g:vimtex_complete_recursive_bib = 1
" Partial solution to fix_paths
let g:vimtex_quickfix_latexlog = {'fix_paths' : 0}
let vimtex_fold_enabled = 1
" work with okular
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
let g:vimtex_view_general_options_latexmk = '--unique'
" }}}
" PROGRAMS: VIMWIKI {{{
" Vimkiwi setup
let g:vimwiki_list = [{'path':'$HOME/Documents/Nvim/Vimwiki',
                     \ 'syntax': 'markdown', 'ext': '.wiki'}]
                     " \ 'syntax': 'markdown', 'ext': '.wiki'}]
                     " \ {'path':'$HOME/Documents/Repositories/MyWebPage/_drafts',
                     " \ 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_table_mappings = 0
let $blogdir = '/home/chaconmo/Documents/Repositories/erickchacon/'
" let g:vimwiki_folding='list' # not very well implemented
" let g:vimwiki_folding='expr'
" let g:vimwiki_global_ext = 0 " do not override markdown outside vimwiki folder.
" let g:vimwiki_char_bold = '**'
" let g:vimwiki_char_italic = '_'
" inoremap <F13> <Esc>:VimwikiReturn 1 5<CR>
" nmap <Leader>w <Plug>VimwikiIndex
" nmap <Leader>wf <Plug>VimwikiFollowLink
" nmap <Leader>wn <Plug>VimwikiNextLink
" imap <Leader>wn <Plug>vimwiki_i_<CR>
" nmap <Leader>eq <plug>(vimtex-a$)
" inoremap <Leader> <CR> <C-r>=<SID>my_cr_function()<CR>
" function! s:my_cr_function() abort
"   return deoplete#close_popup() . "\<CR>"
" endfunction
" map <buffer> <C-G> :s/^/\/\//<Esc><Esc>

" Spelling
" set spell spelllang=en_us
" set spell
hi! link VimwikiHeader1 WarningMsg
hi! link VimwikiHeader2 PreProc
hi! link VimwikiHeader3 Boolean
hi! link VimwikiHeader4 Type
hi! link VimwikiHeader5 Identifier
hi! link VimwikiHeader6 String

" hi! link VimwikiHeader1 GruvboxRedBold
" hi! link VimwikiHeader2 GruvboxAquaBold
" hi! link VimwikiHeader3 GruvboxPurpleBold
" hi! link VimwikiHeader4 GruvboxYellowBold
" hi! link VimwikiHeader5 GruvboxBlueBold
" hi! link VimwikiHeader6 GruvboxGreenBold
" }}}
" PROGRAMS: MARKDOWN {{{
" let g:markdown_composer_browser = "firefox"
let g:markdown_composer_autostart = 0

" markdown plasticboy
let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_new_list_item_indent = 2
" }}}
" PROGRAMS: HTML {{{
" html yaml syntax highlighting
" autocmd BufNewFile,BufRead *.html syntax match Comment /\%^---\_.\{-}---$/
" }}}
" PROGRAMS: CPP {{{
let g:cpp_class_scope_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_concepts_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1
let c_no_curly_error=1
" }}}
" PROGRAMS: PYTHON {{{
let python_highlight_all = 1
" }}}
" PROGRAMS: JULIA {{{
let g:default_julia_version = "current"
" }}}
