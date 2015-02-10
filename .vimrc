" GENERAL SETTINGS:{{{1
set nocompatible
filetype plugin indent on
syntax on
color mycolor
set foldmethod=marker
set autoindent
set autoread
set autowrite
set background=dark
set backspace=indent,eol,start
set nobackup
set cindent
set cinoptions=:0
set cursorline
set completeopt=longest,menuone
set noexpandtab
set fileencodings=utf-8,gb2312,gbk,gb18030
set fileformat=unix
set foldenable
set guioptions-=T
set guioptions-=m
set guioptions-=r
set guioptions-=l
set helpheight=10
set helplang=cn
set hidden
set history=100
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set mouse=a
set number
set pumheight=10
set ruler
set scrolloff=5
set shiftwidth=4
set showcmd
set smartindent
set smartcase
set tabstop=4
set termencoding=utf-8,gb18030
set textwidth=80
set whichwrap=h,l
set wildignore=*.bak,*.o,*.e,*~
set wildmenu
set wildmode=list:longest,full
" set tags=/usr/include/tags
" set nowrap

" AUTO COMMANDS: {{{1
" auto expand tab to blanks
" autocmd FileType c,cpp set expandtab
" Restore the last quit position when open file.
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \     exe "normal g'\"" |
	\ endif
" autocmd bufreadpost *.[ch],*.cpp,*.sh,*.java,*.php,*.py exec ":Tlist"
autocmd BufRead *.[ch],*.cpp,*.sh,*.java,*.php,*.py exec ":Tlist"
" autocmd BufWrite *.[ch],*.cpp,*.sh,*.java,*.php,*.py exec ":!ctags -R *"
autocmd BufWrite *.[ch],*.cpp,*.sh,*.java,*.php,*.py exec ":!ctags -R --languages=c++ --langmap=c++:+.inl -h +.inl --c++-kinds=+px --fields=+aiKSz --extra=+q --exclude=.git &"
" autocmd BufWritePost *.cpp,*.c,*.h :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q
" SHORTCUT SETTINGS: {{{1
" Set mapleader
let mapleader=","

function ClosePair(char)  
    if getline('.')[col('.') - 1] == a:char  
        return "\<Right>"  
    else  
        return a:char  
    endif  
endfunction 

" "cd" to change to open directory.
let OpenDir=system("pwd")
nmap <silent> <leader>cd :exe 'cd ' . OpenDir<cr>:pwd<cr>

" PLUGIN SETTINGS: {{{1
" taglist.vim
let Tlist_Use_Right_Window=1
let Tlist_Auto_Open=1
let g:Tlist_Auto_Update=1
let g:Tlist_Process_File_Always=1
let g:Tlist_Exit_OnlyWindow=1
let g:Tlist_Show_One_File=1
let g:Tlist_WinWidth=25
let g:Tlist_Enable_Fold_Column=0
let g:Tlist_Auto_Highlight_Tag=1

" NERDTree.vim
let g:NERDTreeWinPos="right"
let g:NERDTreeWinSize=25
let g:NERDTreeShowLineNumbers=1
let g:NERDTreeQuitOnOpen=1

"winManager  文件浏览  
let g:winManagerWidth=20
let g:winManagerWindowLayout='FileExplorer'  
" let g:winManagerWindowLayout='FileExplorer|BufExplorer'  
nmap <silent> wm :WMToggle<cr>  
let g:AutoOpenWinManager=1

" cscope.vim
if has("cscope")
	set cscopequickfix=s-,c-,d-,i-,t-,e-
    set csto=1
    set cst
    set nocsverb
    if filereadable("cscope.out")
        cs add cscope.out
    endif
    set csverb
endif
" OmniCppComplete.vim
let g:OmniCpp_DefaultNamespaces=["std"]
let g:OmniCpp_MayCompleteScope=1
let g:OmniCpp_SelectFirstItem=2
" VimGDB.vim
if has("gdb")
	set asm=0
	let g:vimgdb_debug_file=""
	run macros/gdb_mappings.vim
endif
" LookupFile setting
let g:LookupFile_TagExpr='"./tags.filename"'
let g:LookupFile_MinPatLength=2
let g:LookupFile_PreserveLastPattern=0
let g:LookupFile_PreservePatternHistory=1
let g:LookupFile_AlwaysAcceptFirst=1
let g:LookupFile_AllowNewFiles=0
" Man.vim
source $VIMRUNTIME/ftplugin/man.vim
" snipMate
let g:snips_author="zhouyixing"
let g:snips_email="1505134838@qq.com"
let g:snips_copyright=" "
" plugin shortcuts
function! RunShell(Msg, Shell)
	echo a:Msg . '...'
	call system(a:Shell)
	echon 'done'
endfunction

nmap 		<tab> 						V>
nmap 		<s-tab> 					V<
vmap 		<tab> > 					gv
vmap 		<s-tab> 					<gv
" Space to command mode.
nnoremap <space> :cs find f 
vnoremap <space> :cs find f 
" Switching between buffers.
" nnoremap <C-h> <C-W>h
" nnoremap <C-j> <C-W>j
" nnoremap <C-k> <C-W>k
" nnoremap <C-l> <C-W>l
" inoremap <C-h> <Esc><C-W>h
" inoremap <C-j> <Esc><C-W>j
" inoremap <C-k> <Esc><C-W>k
" inoremap <C-l> <Esc><C-W>l
nnoremap	<silent> <C-j>				:tp<CR>
nnoremap	<silent> <C-k>				:ts<CR>
nnoremap	<silent> <C-l>				:tn<CR>
inoremap	<silent> <C-j>				<Esc>:tp<CR>
inoremap	<silent> <C-k>				<Esc>:tag <C-R>=expand("<cword>")<cr><cr>
" inoremap	<silent> <C-k>				<Esc>:ts<CR>
inoremap	<silent> <C-l>				<Esc>:tn<CR>
" :inoremap ( ()<ESC>i
" :inoremap ) <c-r>=ClosePair(')')<CR>
" :inoremap { {<CR>}<ESC>O
" :inoremap } <c-r>=ClosePair('}')<CR>
" :inoremap [ []<ESC>i
" :inoremap ] <c-r>=ClosePair(']')<CR>
" :inoremap " ""<ESC>i
" :inoremap ' ''<ESC>i
vnoremap	<C-c>						"+y
vnoremap	<C-v>						"+p
nmap		<leader>b					:!/bin/sh ./setup<cr><cr>
nmap		<F2>						:TlistToggle<cr>
" nmap		<F3>						:NERDTreeToggle<cr>
" nmap		<F4>						:MRU<cr>
nnoremap	<silent> <F3>				:bp<CR>
nnoremap	<silent> <F4>				:bn<CR>
" nnoremap	<silent> <F5>				:b#<CR>
" nmap		<F5> 						<Plug>LookupFile<cr>
" nnoremap	<silent> <F5>				:Rgrep<CR>
" nmap		<F6>						:vimgrep /<C-R>=expand("<cword>")<cr>/ **/*.c **/*.h<cr><C-o>:cw<cr>
" nmap		<F7>						:WMToggle<cr>
inoremap	<silent> <F6>				<Esc>:Rgrep<CR>
nnoremap	<silent> <F6> 				:Rgrep<CR>
nnoremap	<silent> <C-F6>				:?<C-R>=expand("<cword>")<cr><cr>
nnoremap	<silent> <F9> 				:bd<CR>
nmap  		<F10> 						:cp<cr>
nmap  		<F11> 						:cl<cr>
nmap		<F12>						:cn<cr>
nnoremap	<silent> <F9>				:bd<CR>
nmap 		<leader>ss					:cs find s <C-R>=expand("<cword>")<cr><cr>
nmap		<leader>sg					:cs find g <C-R>=expand("<cword>")<cr><cr>
nmap		<leader>sc					:cs find c <C-R>=expand("<cword>")<cr><cr>
nmap		<leader>st					:cs find t <C-R>=expand("<cword>")<cr><cr>
nmap		<leader>se					:cs find e <C-R>=expand("<cword>")<cr><cr>
nmap		<leader>sf					:cs find f <C-R>=expand("<cfile>")<cr><cr>
nmap		<leader>si					:cs find i <C-R>=expand("<cfile>")<cr><cr>
nmap		<leader>sd					:cs find d <C-R>=expand("<cword>")<cr><cr>
nmap 		<leader>cs					:w<cr>
inoremap	<leader>cs 					<Esc>:w<cr>i
vmap 		<leader>cs 					<Esc><Esc>:w<cr>
nmap 		<leader>cw					:wq<cr>
inoremap	<leader>cw 					<Esc>:wq<cr>i
vmap 		<leader>cw 					<Esc><Esc>:wq<cr>

nmap <C-F10> :call RunShell("Generate tags", "ctags -R --languages=c++ --langmap=c++:+.inl -h +.inl --c++-kinds=+px --fields=+aiKSz --extra=+q --exclude=.git &")<cr>
nmap <C-F12> :call RunShell("Generate cscope", "cscope -Rb")<cr>:cs add cscope.out<cr>
