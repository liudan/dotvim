set nocompatible

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

" 
" General
"
let mapleader=","
set backspace=2
set history=100
map Q gq
nmap <Leader>w :w<CR>
nmap <Leader>q :close<CR>
nmap <Leader>x :x<CR>
nmap <Leader>z :q<CR>
set tabstop=4
set shiftwidth=4
nmap <Leader>e :e $MYVIMRC<CR>
nmap <Leader>r :source $MYVIMRC<CR>

" 
" Display
"
set guioptions=
colorscheme oceandeep
set number
set ruler
set showcmd
set cmdheight=2
set scrolloff=3
set laststatus=2

" 
" Moving
"
nnoremap j gj
nnoremap k gk
nnoremap <Space> gjgjgjgjgj
nnoremap <BS> gkgkgkgkgk
map <Leader>j <C-W>j
map <Leader>k <C-W>k
map <Leader>h <C-W>h
map <Leader>l <C-W>l
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-h> <C-W>h
map <C-L> <C-W>l

" 
" Editing
"
inoremap <C-U> <C-G>u<C-U>
inoremap <C-W> <C-G>u<C-W>
map <Leader>a ggVG
map <Leader><Leader> "+
inoremap <C-B> <Esc>"+gpa
inoremap <F2> Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
map <F6> f>hV%
map <F7> F>ld/<<CR><F5>
map <F8> i<CR><Esc>
map <F10> 0f,r<Space>a{<Esc>
map <F11> 0f{xxa,<Esc>

" 
" Searching
"
set incsearch
nnoremap <silent> <F5> :nohlsearch<Bar>:echo<CR>
vnoremap * y/<C-R>"<CR>
vnoremap # y?<C-R>"<CR>
nnoremap <silent> <F2> /[^\x00-\x7f]<CR>

" 
" NERDTree plugin
"
let NERDTreeQuitOnOpen=1
let NERDTreeChDirMode=2
nnoremap <Leader>ff :NERDTree 
nnoremap <silent> <F4> :NERDTreeToggle<CR>

" 
" FuzzyFinder plugin
"
let g:fuf_modesDisable=[]
let g:fuf_mrufile_maxItem=400
let g:fuf_mrucmd_maxItem=400
nnoremap <silent> <Leader>fb :FufBuffer<CR>
nnoremap <silent> <Leader>fd :FufDirWithCurrentBufferDir<CR>
nnoremap <silent> <Leader>fj :FufJumpList<CR>
nnoremap <silent> <Leader>fc :FufChangeList<CR>
nnoremap <silent> <Leader>fl :FufLine<CR>

" 
" taglist plugin
"
let Tlist_GainFocus_On_ToggleOpen=1
let Tlist_Close_On_Select=1
nnoremap <silent> <F9> :TlistToggle<CR>

" 
" VCSCommand plugin
"
let VCSCommandMapPrefix='<Leader>v'
nmap <Leader>vp :VCSVimDiff 

"|:VCSAdd|
"|:VCSAnnotate|
"|:VCSBlame|
"|:VCSCommit|
"|:VCSDelete|
"|:VCSDiff|
"|:VCSGotoOriginal|
"|:VCSLog|
"|:VCSRemove|
"|:VCSRevert|
"|:VCSReview|
"|:VCSStatus|
"|:VCSUpdate|
"|:VCSVimDiff|
"|<Leader>|ca VCSAdd
"|<Leader>|cn VCSAnnotate
"|<Leader>|cN VCSAnnotate!
"|<Leader>|cc VCSCommit
"|<Leader>|cD VCSDelete
"|<Leader>|cd VCSDiff
"|<Leader>|cg VCSGotoOriginal
"|<Leader>|cG VCSGotoOriginal!
"|<Leader>|ci VCSInfo
"|<Leader>|cl VCSLog
"|<Leader>|cL VCSLock
"|<Leader>|cr VCSReview
"|<Leader>|cs VCSStatus
"|<Leader>|cu VCSUpdate
"|<Leader>|cU VCSUnlock
"|<Leader>|cv VCSVimDiff
