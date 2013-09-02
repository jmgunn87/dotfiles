execute pathogen#infect()

syntax enable
set t_Co=256
set background=dark
let g:solarized_termcolors=256
colorscheme solarized

retab                         " convert all tabs to spaces
set noswapfile
set mouse=a
set clipboard=unnamed " Enhance command-line completion
set wildmenu " Allow cursor keys in insert mode
set binary
set esckeys
set lcs=tab:▸\ ,nbsp:_
set noeol
set incsearch
set hlsearch
set list
set mouse=a
set shiftwidth=2
set tabstop=2
set expandtab
set autoindent smartindent    " auto/smart indent
set smarttab                  " tab and backspace are smart
set ruler                     " show the line number on the bar
set more                      " use more prompt
set autoread                  " watch for file changes
set number                    " line numbers
set hidden
set noautowrite               " don't automagically write on :next
set lazyredraw                " don't redraw when don't have to
set showmode
set showcmd
set scrolloff=999             " keep at least 5 lines above/below
set sidescrolloff=999         " keep at least 5 lines left/right
set backspace=indent,eol,start
set whichwrap+=<,>,[,]        " cursor left and right move to next/prev lines
set linebreak
set ttyfast                   " we have a fast terminal
set complete=.,w,b,u,U,t,i,d  " do lots of scanning on tab completion
set noerrorbells " No annoying sound on errors
set novisualbell
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//

filetype on                   " Enable filetype detection
filetype indent on            " Enable filetype-specific indenting
filetype plugin indent on     " Enable filetype-specific plugins

let NERDTreeShowHidden=1
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_symbols = {}
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'
let g:symfony_app_console_caller= "php"
let g:symfony_app_console_path= "app/console"

"--------------------------------------------------"
"----------- JMG functions and commands -----------"
"--------------------------------------------------"
fun! Repaste(search, ...)
  for replacement in a:000
    put = substitute(@0, a:search, replacement, 'g')
  endfor
endfunction

fun! MoveUp() range
  let upln = getline(a:firstline - 1)
  for line in range(a:firstline, a:lastline)
    call setline(line - 1, getline(line))
  endfor
  call setline(a:lastline, upln)
  call setpos(".", [0, a:firstline - 1, 0])
  normal! V
  call setpos(".", [0, a:lastline - 1, 0])
endfunction

fun! MoveDown() range
  let downln = getline(a:lastline + 1)
  let nextln = getline(a:firstline)
  for line in range(a:firstline, a:lastline)
    let thisln = getline(line + 1)
    call setline(line + 1, nextln)
    let nextln = thisln
  endfor
  call setline(a:firstline, downln)
  call setpos(".", [0, a:firstline + 1, 0])
  normal! V
  call setpos(".", [0, a:lastline + 1, 0])
endfunction

vnoremap <silent> <c-u> :call MoveUp() <CR>
vnoremap <silent> <c-d> :call MoveDown() <CR>
command! -nargs=* RP call Repaste(<f-args>)

