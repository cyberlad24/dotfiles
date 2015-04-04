syntax on
noremap ; :

set autoindent                                  " always set autoindenting on
set background=dark                             " dark is always better
set backspace=2                                 " make backspace work
set backupdir=~/.vim/                           " set backup files in same .vim directory (1/2)
set copyindent                                  " copy the previous indentation on autoindenting
set cursorline                                  " highlight the screen line of the cursor
set dictionary=/usr/share/dict/words            " dictionary path, from which the words are being looked up
set directory=~/.vim/                           " set backup files in same .vim directory (2/2)
set hlsearch                                    " highlighs search by default 
set laststatus=2                                " always show statusline 
set matchtime=1                                 " delay to show the matching patern, when 'showmatch' is set
set mouse=a                                     " enable mouse by default (toggle with F12)
set nocompatible                                " system-wide vimrc
set nowrap                                      " no annoying text wrapping
set number                                      " line number 
set omnifunc=syntaxcomplete#Complete            " smart autocompletion for programs
set pastetoggle=<F2>                            " enable/disable paste mode with F2
set printoptions=number:y                       " printing settings with line numbers
set rtp+=~/.vim/bundle/Vundle.vim               " Vundle plugin manager runtimepath
set scrolloff=10                                " lines before and after for scrolling 
set showmatch                                   " bracket matching
set title                                       " change the terminal's title=
set ttyfast                                     " More characters will be sent for redrawing 
set ttymouse=xterm2                             " xterm-like mouse handling
" uses 4 space characters for each indent
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

" dont loose syntax coloring in selection
hi Visual ctermfg=none 

" vim-airline 
let airline_powerline_fonts = 1                 " terminal needs to have powerline font installed

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" detect filetypes
filetype on
filetype plugin indent on

call vundle#rc()

Plugin 'L9'                                     " functions and commands for programming in Vim
Plugin 'altercation/vim-colors-solarized'       " colorscheme for the vim text editor
Plugin 'sjl/badwolf'                            " theme badwolf
Plugin 'bling/vim-airline'                      " mean status/tabline for vim
Plugin 'edkolev/tmuxline.vim'                   " statusline generator for tmux
Plugin 'gmarik/vundle'                          " plugin manager
Plugin 'kien/ctrlp.vim'                         " open files easily
Plugin 'nvie/vim-togglemouse'                   " press F12 to toggle mouse
Plugin 'rizzatti/funcoo.vim'                    " dependency for other plugins
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}      " zen coding (ctrl+e)
Plugin 'scrooloose/syntastic'                   " syntax checking
Plugin 'suan/vim-instant-markdown'              " install markdown
Plugin 'terryma/vim-multiple-cursors'           " ctrl-n to refactor
Plugin 'tpope/vim-fugitive'                     " git magic
Plugin 'airblade/vim-gitgutter'                 " check git changes while you edit
Plugin 'tomtom/tcomment_vim'                    " comment/uncomment code with ctrl + _
Plugin 'scrooloose/nerdtree'                    " fucking nerdtree
Plugin 'mileszs/ack.vim'                        " great ack search ,f
Plugin 'gitv'

let g:instant_markdown_autostart = 0
let NERDTreeShowHidden=1

" ctrl+p - show hidden files
let g:ctrlp_show_hidden = 1
let g:ctrlp_open_new_file = 't'

map <C-l> gt                                    " vim movement left key for tabs
map <C-h> gT                                    " vim movement right key for tabs
map <C-c> "+y                                   " copy selection with ctrl+c
map <C-x> :q<cr>                                " exit ctrl+q

" Make Arrow Keys Useful Again {
map <down> <ESC>:bp<RETURN>
map <left> <ESC>:NERDTreeToggle<RETURN>
map <right> <ESC>:CtrlPMRU<RETURN>
map <up> <ESC>:bn<RETURN>
" }

" use the Tab key to switch windows created by the :sp command
map <Tab> <C-W>W:cd %:p:h<CR>:<CR>
" shortcut for ack
map <leader>f :Ack! 
" }

colorscheme solarized

nmap <leader>/ :let@/=""<CR>                    " ,/ -> clear search 
nmap <leader>v :tabedit $MYVIMRC<CR>            " ,v -> edit ~/.vimrc in new tab
nmap <leader>w :tabedit ~/.dotfiles/dotfiles.wiki/<CR> " ,w -> edit wiki in new tab

" jump to the last position when reopening a file
if has("autocmd")
 au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

if has("gui_running")
   let s:uname = system("uname")
   if s:uname == "Darwin\n"
      set guifont=Inconsolata\ for\ Powerline:h15
   endif
endif

autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS