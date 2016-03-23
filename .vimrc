" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
"runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Needs to be defined at the top of the file, before anything that uses
" mapleader.  But see end of file for my custom leader commands. 
let mapleader="," "beats the heck out of backslash 

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

" Make wildcard matching for opening files work like bash
set wildmode=longest:full,full

" Elliot: set automatically to Unix linefeeds
set ff=unix

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set hidden             " Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

" Set up spacing 
" tabs rather than hard spaces
" setlocal shiftwidth=4 softtabstop=4
au BufRead,BufNewFile *.scad    setfiletype openscad
autocmd FileType openscad setlocal shiftwidth=2 tabstop=2

autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType html setlocal spell
autocmd FileType html setlocal complete+=kspell

au BufRead,BufNewFile *.ino    setfiletype c
autocmd FileType c setlocal shiftwidth=4 tabstop=4
autocmd FileType c set cindent
"autocmd FileType c setlocal textwidth=73

autocmd FileType javascript setlocal shiftwidth=4 tabstop=4

autocmd FileType python setlocal  shiftwidth=4 softtabstop=4
autocmd FileType python setlocal  textwidth=79

autocmd FileType markdown setlocal spell
autocmd FileType markdown setlocal complete+=kspell
autocmd FileType markdown source ~/had/abbreviations

autocmd FileType asciidoc setlocal spell
autocmd FileType asciidoc setlocal complete+=kspell

" Make git commit files start in comment part
autocmd FileType gitcommit call setpos('.', [0, 1, 1, 0])

"autocmd FileType mail setlocal fo+=aw
" This was doing the auto-wrap, which ends up just being a PITA.
autocmd FileType mail setlocal fo-=t
" this removes the auto-wrap, because modern e-mail clients seem not to use
" it.  now will need to navigate around with sentence and paragraph movements.
" Good for me anyway


" for handling binary files directly, run through xxd
" remember to invoke with vim -b
augroup Binary
	au!
	au BufReadPre  *.bin let &bin=1
	au BufReadPost *.bin if &bin | %!xxd
	au BufReadPost *.bin set ft=xxd | endif
	au BufWritePre *.bin if &bin | %!xxd -r
	au BufWritePre *.bin endif
	au BufWritePost *.bin if &bin | %!xxd
	au BufWritePost *.bin set nomod | endif
augroup END


syntax enable
"if has('gui_running')
    "set background=light
    "colorscheme solarized
"else
    set background=dark
    " colo wombat256mod
    " color xoria256
"    color hybrid
    "colo Tomorrow-Night 
"endif
" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
" set background=dark
" set background=light

" Colors for gitgutter (matches wombat256mod)
" highlight SignColumn            ctermbg=232
" highlight GitGutterAddDefault          ctermbg=232
" highlight GitGutterChangeDefault       ctermbg=232
" highlight GitGutterDeleteDefault       ctermbg=232 ctermfg=113
" highlight GitGutterChangeDeleteDefault ctermbg=232

" Convince vim that we have 256 colors
" set t_Co=256
"colo luna-term

"if haven't set the solarized colors yet, need this
"let g:solarized_termcolors=256
"colo solarized

" Powerline
set laststatus=2
" low-tech alternative
"set laststatus=2 statusline=%02n:%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P  

" Some buffer navigation commands
"nnoremap <F1> :w<cr>:make<cr>
"inoremap <F1> <esc>:w<cr>:make<cr>
"nnoremap <C-F1> :w<cr>:Make!<cr>

nnoremap <F1> :w<cr>:make!<cr>
inoremap <F1> <esc>:w<cr>:make!<cr>
nnoremap <C-F1> :w<cr>:make!<cr>

nnoremap <F2> :cnext<cr>
nnoremap <Leader><F2> :cprev<cr>
inoremap <F2> <esc>:cnext<cr>
inoremap <Leader><F2> <esc>:cprev<cr>

" Call up the file browser
"map <F3> :NERDTree<cr>
map <F3> :TlistToggle<cr>


nnoremap <F4> :ls<cr>:buffer<space>
inoremap <F4> <esc>:ls<cr>:buffer<space>

nnoremap <F5> :b#<cr>
inoremap <F5> <esc>:b#<cr>

nnoremap <F6> :GundoToggle<CR>

" Search macros: global search, global search where cursor is 
nnoremap <F7> :%s/<c-r><c-w>//gc<Left><Left><Left>
vnoremap <F7> :s/<c-r><c-w>//gc<Left><Left><Left>
inoremap <F7> <esc>:%s/<c-r><c-w>//gc<Left><Left><Left>

" Search macros: global search, global search where cursor is 
nnoremap <F8> :%s//gc<Left><Left><Left>
vnoremap <F8> :s//gc<Left><Left><Left>
inoremap <F8> <esc>:%s//gc<Left><Left><Left>

" Autorepair last broken spelling
nnoremap <F9> [sz=
inoremap <F9> <esc>[sz=

" Jump to function definition, center
nnoremap <F10> <c-]>zz
inoremap <F10> <esc><c-]>zz

" Write and quit
nnoremap <F11> :wq<cr>
inoremap <F11> <esc>:wq<cr>

" Just write
nnoremap <F12> :w<cr>
inoremap <F12> <esc>:w<cr>

" Navigate panes
" nmap <C-j> <C-w>j
" nmap <C-k> <C-w>k
" nmap <C-h> <C-w>h
" nmap <C-l> <C-w>l

" Arrow keys to move between panes
" map <up> <C-w><up>
" map <down> <C-w><down>
" map <left> <C-w><left>
" map <right> <C-w><right>

" Another pane nav idea
nnoremap gh <C-W><C-H>
nnoremap gj <C-W><C-J>
nnoremap gk <C-W><C-K>
nnoremap gl <C-W><C-L>

" Yet Another pane nav idea
" get rid of arrow keys entirely
" nnoremap <left>        <C-W><C-H>
" nnoremap <up>          <C-W><C-K>
" nnoremap <down>        <C-W><C-J>
" nnoremap <right>       <C-W><C-L>

" Navigating splits and tabs
nnoremap  tt :tabnew<CR>
" nnoremap  [g :tabprevious<CR>
" nnoremap  ]g :tabnext<CR>
nnoremap  vv :vsp<CR>  " vertical split
nnoremap  ss :sp<CR>   " horizontal split

set splitright " When splitting vertically, split to the right
set splitbelow " When splitting horizontally, split below

" set whichwrap=b,s,<,>,[,]

" Swap file is stupid
"set noswapfile
" set backup
" set backupdir=/home/elliot/.vimtmp
" set dir=/home/elliot/.vimtmp

"pathogen path manager
" execute pathogen#infect()
"filetype plugin indent on

"ctrlp plugin
" set runtimepath^=~/.vim/bundle/ctrlp.vim

"auto-reload vimrc
"augroup reload_vimrc " {
    "autocmd!
    "autocmd BufWritePost $MYVIMRC source $MYVIMRC
"augroup END " }


" Line numbering on, set off with set nonu
set nu
" Liking the relative line numbering
set rnu

" colon sucks -- but does this work??!??!
" nnoremap ; :
" nnoremap : ;

" Indentation stuffs
" :inoremap } }<Esc>=%``a
" :set cindent

" highlight tabs
" syntax match Tab /\t/
" hi Tab gui=underline guifg=blue ctermbg=blue

" Make paren-matching less annoying -- only bold up the match
hi MatchParen cterm=bold ctermbg=none ctermfg=none

"auto-indent
" set ai

" automatically save and load fold files  
au BufWinLeave * mkview
au BufWinEnter * silent loadview

" some experiments
" nnoremap ; :
" vnoremap ; :
" these are overwritten by space plugin, re-done in sensible-vim
"

" Extra escape -- really nice way to get back to normal
inoremap ;; <Esc>

" re-select code block after left/right shove
vnoremap < <gv 
vnoremap > >gv 

" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)
" default
" let g:easy_align_ignore_groups = ['Comment', 'String']
let g:easy_align_ignore_groups = ['String']
" Start interactive EasyAlign for a motion/text object (e.g. <Leader>aip)
" nmap <Leader>a <Plug>(EasyAlign)

"" For gvim
"if has("gui")
	"set guioptions -= F
	"set guioptions -= r
	"set guioptions -= m
	"set guioptions -= T
	"set guifont     = Inconsolata-dz\ Medium\ 14
"endif


" Custom leader-mode commands
"
" Repeat last macro
nnoremap <Leader>m @@

" Scroll down half screen, go to bottom of page, put that in middle
nnoremap <Leader>f Lzz
"MztM
" Scroll up half screen: go to top, move that to bottom
nnoremap <Leader>d Hzz
"Mzb

" re-indent all and return 
nnoremap <Leader>= gg=G''

" Close Window
" nnoremap <Leader>w <C-w>c

" Add comment
nnoremap <Leader>c A  /*  */<Esc>2hi
inoremap <Leader>c <Esc>A  /*  */<Esc>2hi
" C++ comments
nnoremap <Leader>C A // 
nnoremap <Leader>C <Esc>A // 

" Awesome bit-shift wrapping macro: type pb1,  
inoremap <Leader>b <Esc>bi(1 << <Esc>g~eea)<Esc>la
nnoremap <Leader>b bi(1 << <Esc>g~eea)<Esc>la

" Align c-style comments
vnoremap <Leader>c :EasyAlign /\/\*/<Enter>gv:EasyAlign /\*\//<Enter>
" Align c++-style comments
vnoremap <Leader>C :EasyAlign /\/\//<Enter>
" Generic align with regex
vnoremap <Leader>a :EasyAlign /

" paste from unix buffer
nnoremap <Leader>p "+po<Esc>
nnoremap <Leader>P "*po<Esc>
" skip to next e-mail
nnoremap <Leader>n /Date:<Enter>z<Enter>

" close current window 
nnoremap <Leader><del> <C-W>c

" git diff
nnoremap <Leader>gd :!clear && git diff<Cr>

" jump to next function, center
nnoremap <Leader>z ]]zz
" jump to previous function, center
nnoremap <Leader>Z [[zz

" Cut current line/paragraph, put it at the end of the document
nnoremap <Leader>e VdGp''
nnoremap <Leader>E vapdGo<Esc>p''

" Leader command for exchange plugin
nnoremap <Leader>x cxiw

nnoremap <Leader>w yawdawi[c<Esc>:!sr wikipedia <C-r>" & 

" Hackaday stuff
nnoremap <Leader>] bi[<Esc>ea]<Esc>e
inoremap <Leader>] <Esc>bi[<Esc>ea]<Esc>ea


