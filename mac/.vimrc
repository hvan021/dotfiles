set encoding=utf-8


" Setup Pathogen to manage your plugins
" mkdir -p ~/.vim/autoload ~/.vim/bundle
" curl -so ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/HEAD/autoload/pathogen.vim
" Now you can install any plugin into a .vim/bundle/plugin-name/ folder
 call pathogen#infect()


" Automatic reloading of .vimrc
 autocmd! bufwritepost .vimrc source %

" Enable syntax highlighting
" You need to reload this file for the change to apply
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


" Better copy & paste
" When you want to paste large blocks of code into vim, press F2 before you
" paste. At the bottom you should see ``-- INSERT (paste) --``.

 set pastetoggle=<F2>
 set clipboard=unnamed


" General option
" ===============

set wildmode=list:longest " make TAB behave like in a shell
set autoread " reload file when changes happen in other editors
set tags=./tags

" Mouse and backspace
 set mouse=a  " on OSX press ALT and click
 set bs=2     " make backspace behave like normal again

" Useful settings
 set history=700
 set undolevels=700


" Make search case insensitive
 set hlsearch
 set incsearch
 set ignorecase
 set smartcase


" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
 set nobackup
 set nowritebackup
 set noswapfile

" ============================================================================ 
" -------- KEY BINDING SETTINGS ----
" ============================================================================ 

" Rebind <Leader> key
" I like to have it here becuase it is easier to reach than the default and
" it is next to ``m`` and ``n`` which I use for navigating between tabs.
 let mapleader = ","
" nnoremap . <NOP>

" Bind nohl
noremap <Leader>h :nohl<CR>

" Quicksave command
 noremap <Leader>s :update<CR>
 vnoremap <Leader>s <C-C>:update<CR>
 inoremap <Leader>s <Esc>:update<CR>


" Quick quit command
 noremap <Leader>e :quit<CR>  " Quit current window
 noremap <Leader>E :qa!<CR>   " Quit all windows


" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
" Every unnecessary keystroke that can be saved is good for your health :)
 map <c-j> <c-w>j
 map <c-k> <c-w>k
 map <c-l> <c-w>l
 map <c-h> <c-w>h

" map jk and kj to ESC
inoremap jj <esc>
"inoremap kj <esc>

" easier moving between tabs
 map <Leader>n <esc>:tabprevious<CR>
 map <Leader>m <esc>:tabnext<CR>


" easier formatting of paragraphs
 vmap Q gq
 nmap Q gqap

" map sort function to a key
" vnoremap <Leader>s :sort<CR>


" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
 vnoremap < <gv  " better indentation
 vnoremap > >gv  " better indentation


map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>
vnoremap <Leader>s :sort<CR>

" new settings
map <Leader>a ggVG  " select all


" center the cursor vertically
nnoremap <Leader>zz :let &scrolloff=999-&scrolloff<CR>

" remove trailing white space
 map <Leader>x :%s/\s\+$//


 
" ============================================================================ 
" -------  THEMES - FONTS - GUI --------
" ============================================================================ 


" Show trailing whitespace
" =========================
" MUST be inserted BEFORE the colorscheme command
 autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
 au InsertLeave * match ExtraWhitespace /\s\+$/
 

" Color scheme
" mkdir -p ~/.vim/colors && cd ~/.vim/colors
" wget -O wombat256mod.vim http://www.vim.org/scripts/download_script.php?src_id=13400
 set t_Co=256
 color wombat256mod
 set colorcolumn=80
 highlight ColorColumn ctermbg=233

" Showing line numbers and length
 set number  " show line numbers
 set tw=79   " width of document (used by gd)
 set nowrap  " don't automatically wrap on load
 set fo-=t   " don't automatically wrap text when typing

" No bullshit folding magic
" =========================
set foldmethod=indent
"set foldnestmax=2
nnoremap <space> zA
vnoremap <space> zA

" When opening the file, unfold all. Fold all with zM
" au BufRead * normal zR


" Settings for vim-powerline -- Ubutu settings only here -- MODIFY it for
" Windows and MAC OS
" cd ~/.vim/bundle
" git clone git://github.com/Lokaltog/vim-powerline.git
" see here for powerline for multiple apps on Ubuntu
" http://askubuntu.com/questions/283908/how-can-i-install-and-use-powerline-plugin
"""" Ubuntu settings
" set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/
" set laststatus=2

" Settings for vim-powerline
" ===========================

"source /usr/local/lib/python2.7/site-packages/powerline/bindings/vim/plugin/source_plugin.vim
source ~/Library/Python/2.7/lib/python/site-packages/powerline/bindings/vim/plugin/powerline.vim

set laststatus=2
let g:Powerline_symbols = 'fancy'



" ============================================================================
" CUSTOMIZED FUNCTIONS
" ============================================================================ " Awesome line number magic

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



" ============================================================================
" ADD-ON & PLUGGINS
" ============================================================================

" DelimitMate
" ===========
let delimitMate_expand_cr = 1

" UltiSnips
" =========
set runtimepath+=~/.vim/bundle/UltiSnips
set runtimepath+=~/.vim/snippets
let g:UltiSnipsSnippetsDir = "~/.vim/snippets/"
let g:UltiSnipsSnippetDirectories = ['UltiSnips', 'snippets']
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"


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


" Settings for jedi-vim
" =====================
let g:jedi#usages_command = "<leader>n"
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>


" Settings for vim-markdown
" ==========================
" let g:vim_markdown_folding_disabled=1
let g:vim_markdown_initial_foldlevel=1


" Settings for ctrlp
" ===================
let g:ctrlp_max_height = 30

" Fixing the copy & paste madness
" ================================
" vmap <C-y> y:call system("xclip -i -selection clipboard", getreg("\""))<CR>:call system("xclip -i", getreg("\""))<CR>
" nmap <C-v> :call setreg("\"",system("xclip -o -selection clipboard"))<CR>p
" imap <C-v> <Esc><C-v>a

" map <Leader>v :source ~/.vimrc

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

" NerdCommenter settings
 filetype plugin on

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

" source ~/.vim/vimrc/vimrc_python.vim
" source ~/.vim/bundle/pydiction/vimrc_pydiction.vim


" ============================================================================
" PYTHON IDE SETUP
" ============================================================================


" Real programmers don't use TABs but spaces
 set tabstop=4
 set softtabstop=4
 set shiftwidth=4
 set shiftround
 set expandtab


" Settings for ctrlp
" cd ~/.vim/bundle
" git clone https://github.com/kien/ctrlp.vim.git
 let g:ctrlp_max_height = 30
 set wildignore+=*.pyc
 set wildignore+=*_build/*
 set wildignore+=*/coverage/*


" Settings for python-mode
" Note: I'm no longer using this. Leave this commented out
" and uncomment the part about jedi-vim instead
" cd ~/.vim/bundle
" git clone https://github.com/klen/python-mode
 "map <Leader>g :call RopeGotoDefinition()<CR>
 "let ropevim_enable_shortcuts = 1
 "let g:pymode_rope_goto_def_newwin = "vnew"
 "let g:pymode_rope_extended_complete = 1
 "let g:pymode_breakpoint = 0
 "let g:pymode_syntax = 1
 "let g:pymode_syntax_builtin_objs = 0
 "let g:pymode_syntax_builtin_funcs = 0
 "map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" Settings for jedi-vim
" cd ~/.vim/bundle
" git clone git://github.com/davidhalter/jedi-vim.git
 let g:jedi#usages_command = "<leader>z"
 let g:jedi#popup_on_dot = 0
 let g:jedi#popup_select_first = 0
 map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" Better navigating through omnicomplete option list
" See http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
 set completeopt=longest,menuone
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


" Python folding
" mkdir -p ~/.vim/ftplugin
" wget -O ~/.vim/ftplugin/python_editing.vim http://www.vim.org/scripts/download_script.php?src_id=5492
 set nofoldenable


