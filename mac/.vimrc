set encoding=utf-8
autocmd! bufwritepost .vimrc source %
call pathogen#infect()

filetype off
filetype plugin indent on
syntax on
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType java set completeopt-=preview
autocmd Filetype java setlocal completefunc=javacomplete#CompleteParamsInfo
autocmd Filetype java setlocal omnifunc=javacomplete#Complete


let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

set grepprg=ack\ -k


" BEGIN things for Java development
" =============================================================================

" Syntastic
" =========
"let jshint2_save = 1


" Javacomplete
" ============
"func! s:SetClasspath()
"    lcd %:p:h
"    let gradle_settings = findfile('settings.gradle', '.;')
"    let project_root = fnamemodify(gradle_settings, ":p:h")
"    call javacomplete#SetSourcePath(project_root)
"    let $CLASSPATH = $CLASSPATH . ":" . project_root . "/desktop/build/libs/*"
"endfunc
"autocmd VimEnter * call s:SetClasspath()


" END tings for Java development
" =============================================================================


" DelimitMate
" ===========
let delimitMate_expand_cr = 1


" No bullshit folding magic
" =========================
set foldmethod=indent
set foldnestmax=2
nnoremap <space> zA
vnoremap <space> zA

" When opening the file, unfold all. Fold all with zM
" au BufRead * normal zR


" UltiSnips
" =========
set runtimepath+=~/.vim/bundle/UltiSnips
set runtimepath+=~/.vim/snippets
let g:UltiSnipsSnippetsDir = "~/.vim/snippets/"
let g:UltiSnipsSnippetDirectories = ['UltiSnips', 'snippets']
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"


" General option
" ===============
let mapleader = "," " rebind <Leader> key
nnoremap . <NOP>
set wildmode=list:longest " make TAB behave like in a shell
set autoread " reload file when changes happen in other editors
set tags=./tags

set mouse=a
set bs=2 " make backspace behave like normal again
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*


" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile


" make yank copy to the global system clipboard
set clipboard=unnamed


" Omnicomplete related stuff
set completeopt=longest,menuone
inoremap <c-space> <C-x><C-o>
inoremap <c-@> <C-x><C-o>


" found here: http://stackoverflow.com/a/2170800/70778
function! OmniPopup(action)
    if pumvisible()
        if a:action == 'j'
            return "\<C-N>"
        elseif a:action == 'k'
            return "\<C-P>"
        endif
    endif
    return a:action
endfunction
inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>


" Quicksave command
noremap <Leader>w :update<CR>
vnoremap <Leader>w <C-C>:update<CR>
inoremap <Leader>w <C-O>:update<CR>
      

" Quick quit command
noremap <Leader>e :quit<CR>


" Bind nohl
noremap <Leader>h :nohl<CR>

set history=700
set undolevels=700


set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab
" disable formatting when pasting large chunks of code
set pastetoggle=<F2>

set hlsearch
set incsearch
set ignorecase
set smartcase

set nowrap " don't automatically wrap on load
set tw=79  " width of document (used by gd)
set fo-=t  " don't automatically wrap text when typing

" Awesome line number magic
function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

nnoremap <Leader>l :call NumberToggle()<cr>
:au FocusLost * set number
:au FocusGained * set relativenumber
autocmd InsertEnter * set number
autocmd InsertLeave * set relativenumber
set relativenumber

" center the cursor vertically
:nnoremap <Leader>zz :let &scrolloff=999-&scrolloff<CR>


" easier formatting of paragraphs
vmap Q gq
nmap Q gqap


" Settings for jedi-vim
" =====================
let g:jedi#usages_command = "<leader>n"
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>


" Settings for vim-powerline
" ===========================

"source /usr/local/lib/python2.7/site-packages/powerline/bindings/vim/plugin/source_plugin.vim
source ~/Library/Python/2.7/lib/python/site-packages/powerline/bindings/vim/plugin/powerline.vim

"python from powerline.bindings.vim import source_plugin; source_plugin()
"python import sys; sys.path.append("/Library/Python/2.7/site-packages")

"python import sys; sys.path.append("/Users/huy/Library/Python/2.7/lib/python/site-packages") 

"python from powerline.ext.vim import source_plugin; source_plugin()

set laststatus=2
" let g:Powerline_symbols = 'fancy'


" Settings for vim-markdown
" ==========================
" let g:vim_markdown_folding_disabled=1
let g:vim_markdown_initial_foldlevel=1


" Settings for ctrlp
" ===================
let g:ctrlp_max_height = 30

"
" Movement
" =========
" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

map <Leader>, <esc>:tabprevious<CR>
map <Leader>. <esc>:tabnext<CR>
vnoremap <Leader>s :sort<CR>


" Custom mappings
" ================
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation
map <Leader>a ggVG  " select all


" Fixing the copy & paste madness
" ================================
vmap <C-y> y:call system("xclip -i -selection clipboard", getreg("\""))<CR>:call system("xclip -i", getreg("\""))<CR>
nmap <C-v> :call setreg("\"",system("xclip -o -selection clipboard"))<CR>p
imap <C-v> <Esc><C-v>a


" Show trailing whitespace
" =========================
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/
map <Leader>x :%s/\s\+$//


" Color scheme
" =============
set t_Co=256
color wombat256mod
" color mayansmoke

set colorcolumn=80
highlight ColorColumn ctermbg=233
map <Leader>v :source ~/.vimrc

" Compile bootstrap.css when saving a .less file
func! s:CompileLess()
    lcd %:p:h
    let static_dir = finddir('static', ';')
    let l:cmd = "cd " . l:static_dir . " && lessc css/bootstrap.less css/bootstrap.css"
    let l:cmd2 = "cd " . l:static_dir . " && lessc css2/bootstrap.less css2/bootstrap.css"
    let l:errs = system(l:cmd)
    let l:errs = system(l:cmd2)
    if (!empty(l:errs))
        echo l:errs
    endif
endfunc
autocmd! BufWritePost,FileWritePost *.less call s:CompileLess()

" source ~/.vim/vimrc/vimrc_python.vim
" source ~/.vim/bundle/pydiction/vimrc_pydiction.vim
