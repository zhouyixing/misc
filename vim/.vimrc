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
" set noexpandtab
set expandtab
set shiftwidth=4
set tabstop=4
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
" set ignorecase
set incsearch
set laststatus=2
set mouse=
set number
set pumheight=10
set ruler
set scrolloff=5
set showcmd
set smartindent
set smartcase
set termencoding=utf-8,gb18030
set textwidth=120
set cc=120
set whichwrap=h,l
set wildignore=*.bak,*.o,*.e,*~
set wildmenu
set wildmode=list:longest,full
" set tags=/usr/include/tags
" set nowrap

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
" PLUGIN SETTINGS: {{{1
" taglist.vim
let Tlist_Use_Right_Window=1
let Tlist_Auto_Open=1
let g:Tlist_Auto_Update=1
let g:Tlist_Process_File_Always=1
let g:Tlist_Exit_OnlyWindow=1
let g:Tlist_Show_One_File=1
let g:Tlist_WinWidth=32
let g:Tlist_Enable_Fold_Column=0
let g:Tlist_Auto_Highlight_Tag=1

" NERDTree.vim
let g:NERDTreeWinPos="right"
let g:NERDTreeWinSize=25
let g:NERDTreeShowLineNumbers=1
let g:NERDTreeQuitOnOpen=1

"winManager  文件浏览  
let g:winManagerWidth=16
" let g:winManagerWindowLayout='FileExplorer'  
let g:winManagerWindowLayout='FileExplorer|BufExplorer'  
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

let g:GenCtagsCmd='ctags -R --languages=c++ --langmap=c++:+.inl -h +.inl --c++-kinds=+px --fields=+aiKSz --extra=+q --exclude=.git &'
let g:vGenCtagsCmd=':!' . g:GenCtagsCmd
function! GenCtags()
	echo 'Generate tags...'
	call system(g:GenCtagsCmd)
	echon 'done'
endfunction

let g:GenCscopeCmd='cscope -bqk -i cscope.files'
function! GenCscope()
	echo 'Generate cscope.out...'
	call system(g:GenCscopeCmd)
	echon 'done'
endfunction

"Switch to current dir  
function! My_ChangeToFilePath()  
  try  
    if exists("g:last_work_path")
      let g:last_last_work_path = g:last_work_path
    endif  
  catch  
    echo v:errmsg
  endtry  
  let g:last_work_path = escape(getcwd(), " ")
  let str = expand("%:p:h")
" let str = s:Escape(str)
  execute "cd ".str
endfunction

function! My_ChangeToLastPath()
  execute "cd ".g:last_work_path
endfunction

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

" AUTO COMMANDS: {{{1
" auto expand tab to blanks
" autocmd FileType c,cpp set expandtab
" Restore the last quit position when open file.
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \     exe "normal g'\"" |
	\ endif
" autocmd Bufreadpost	*.[ch],*.cpp,*.sh,*.java,*.php,*.py		exec ":Tlist"
" autocmd BufRead		*.[ch],*.cpp,*.sh,*.java,*.php,*.py		exec ":Tlist"
" autocmd BufWrite		*.[ch],*.cpp,*.sh,*.java,*.php,*.py		exec g:vGenCtagsCmd
" autocmd BufWrite		*.[ch],*.cpp,*.java,*.php,*.py			exec g:vGenCtagsCmd
" autocmd BufWritePost	*.cpp,*.c,*.h							exec g:vGenCtagsCmd

nmap 		<tab> 						V>
nmap 		<s-tab> 					V<
vmap 		<tab> 						>gv<ESC><ESC>
vmap 		<s-tab> 					<gv<ESC><ESC>
" Space to command mode.
nnoremap	<space>						:cs find f 
vnoremap	<space>						:cs find f 
" Switching between buffers.
" nnoremap <C-h> <C-W>h
" nnoremap <C-j> <C-W>j
" nnoremap <C-k> <C-W>k
" nnoremap <C-l> <C-W>l
" inoremap <C-h> <Esc><C-W>h
" inoremap <C-j> <Esc><C-W>j
" inoremap <C-k> <Esc><C-W>k
" inoremap <C-l> <Esc><C-W>l
" nmap		<silent> ls 				:!ls<cr>
" nmap		<silent> wm 				:WMToggle<cr>
" nnoremap	<silent> mw					:bd<CR>
" nnoremap	<silent> qq					:qall<CR>
nnoremap	<silent> <C-j>				:tp<CR>
nnoremap	<silent> <C-k>				:ts<CR>
nnoremap	<silent> <C-l>				:tn<CR>
inoremap	<silent> <C-j>				<Esc>:tp<CR>
inoremap	<silent> <C-k>				<Esc>:tag <C-R>=expand("<cword>")<cr><cr>
" inoremap	<silent> <C-k>				<Esc>:ts<CR>
inoremap	<silent> <C-l>				<Esc>:tn<CR>
" :inoremap (							()<ESC>i
" :inoremap )							<c-r>=ClosePair(')')<CR>
" :inoremap {							{<CR>}<ESC>O
" :inoremap }							<c-r>=ClosePair('}')<CR>
" :inoremap [							[]<ESC>i
" :inoremap ]							<c-r>=ClosePair(']')<CR>
" :inoremap "							""<ESC>i
" :inoremap '							''<ESC>i
vnoremap	<C-y>						"+y
inoremap	<C-p>						<Esc>"+p
vnoremap	<C-p>						<Esc>"+p
nmap		<C-p>						"+p
nmap		<leader>b					:!/bin/sh ./setup<cr><cr>
nnoremap	<leader>f					:/<C-R>=expand("<cword>")<cr><cr>
nnoremap	<leader>bf					:?<C-R>=expand("<cword>")<cr><cr>
nmap		<silent> <leader>cd			:call My_ChangeToFilePath()<cr>
nmap		<silent> <leader>cw			:exe 'cd ' . OpenDir<cr>:pwd<cr>
nmap		<silent> <leader>cl			:call My_ChangeToLastPath()<cr>

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
inoremap	<silent> <F5>				<Esc>:Rgrep<CR>
nnoremap	<silent> <F5> 				:Rgrep<CR>
" nnoremap	<silent> <F9> 				:bd<CR>
nmap        <F6>                        :w<cr>
inoremap    <F6>                        <Esc>:w<cr>
vnoremap    <F6>                        <Esc>:w<cr>
nmap        <C-F6>                      :wall<cr>
inoremap    <C-F6>                      <Esc>:wall<cr>
vnoremap    <C-F6>                      <Esc>:wall<cr>
nmap  		<F7> 						:cp<cr>
nmap		<F8>						:cn<cr>
nmap  		<F9> 						:cl<cr>
" nmap  	<F9> 						:call GenCtags()<cr>
nmap 		<leader>ss					:cs find s <C-R>=expand("<cword>")<cr><cr>
nmap		<leader>sg					:cs find g <C-R>=expand("<cword>")<cr><cr>
nmap		<leader>sc					:cs find c <C-R>=expand("<cword>")<cr><cr>
nmap		<leader>st					:cs find t <C-R>=expand("<cword>")<cr><cr>
nmap		<leader>se					:cs find e <C-R>=expand("<cword>")<cr><cr>
nmap		<leader>sf					:cs find f <C-R>=expand("<cfile>")<cr><cr>
nmap		<leader>si					:cs find i <C-R>=expand("<cfile>")<cr><cr>
nmap		<leader>sd					:cs find d <C-R>=expand("<cword>")<cr><cr>
" nmap		<leader>sc					:call GenCscope()<cr>:cs add cscope.out<cr>
" vmap		<leader>sc					:call GenCscope()<cr>:cs add cscope.out<cr>
" nmap		<leader>cs					:call GenCscope()<cr>:cs add cscope.out<cr>
" vmap		<leader>cs					:call GenCscope()<cr>:cs add cscope.out<cr>
" nmap		<leader>cs					:cs add cscope.out<cr>
" vmap		<leader>cs					:cs add cscope.out<cr>
" nmap 		<leader>cs					:w<cr>
" inoremap	<leader>cs 					<Esc>:w<cr>i
" vmap 		<leader>cs 					<Esc><Esc>:w<cr>
" nmap 		<leader>cw					:wq<cr>
" inoremap	<leader>cw 					<Esc>:wq<cr>i
" vmap 		<leader>cw 					<Esc><Esc>:wq<cr>

nmap 		<leader>ls					:!ls<cr>
inoremap	<leader>ls 					<Esc>:!ls<cr>i
vmap 		<leader>ls 					<Esc><Esc>:!ls<cr>

" nmap		<C-F10>						:call GenCtags()<cr>
" nmap		<C-F12>						:call GenCscope()<cr>:cs add cscope.out<cr>
nmap        <F12>						:cs reset<cr><cr>
inoremap    <F12>						<Esc>:cs reset<cr><cr>
vnoremap    <F12>						<Esc>:cs reset<cr><cr>
nmap        <C-F12>						:call GenCscope()<cr>
inoremap    <C-F12>						<Esc>:call GenCscope()<cr>
vnoremap    <C-F12>						<Esc>:call GenCscope()<cr>
