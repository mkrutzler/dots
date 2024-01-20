" Settings
set nocompatible
syntax on
set tabstop=2
set shiftwidth=2
set expandtab
set ai
set number
set hlsearch
set ruler
highlight Comment ctermfg=green
set encoding=utf-8
set wildmode=longest,list,full
autocmd Filetype * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
let mapleader = "£"
map <leader>oe :setlocal spell! spelllang=en_us<CR>
map <leader>og :setlocal spell! spelllang=de_DE<CR>
autocmd BufWritePre * %s/\s\+$//e

"Word Counter script:
function! WC()
    let filename = expand("%")
    let cmd = "detex " . filename . " | wc -w | tr -d '[:space:]'"
    let result = system(cmd)
    echo result . " words"
endfunction
command WC call WC()



"ssetup jump to placeholder:   vvvv
inoremap <leader><leader> <Esc>/<++><Enter>"_c4l


"vimtex
filetype plugin indent on
syntax enable
let g:tex_flavor='latex'
let g:vimtex_view_general_viewer='sioyek'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'






"Snippets (without plugin
"sample snippet:
"autocmd Filetype FILETYPE inoremap £KEY STUFF TO INSERT



"latex

autocmd Filetype tex inoremap $se \section{°}<Enter><Enter><++><Esc>2k0f°cl
autocmd Filetype tex inoremap $sbs \subsection{°}<Enter><Enter><++><Esc>2k0f°cl
autocmd Filetype tex inoremap $sbbs \subsubsection{°}<Enter><Enter><++><Esc>2k0f°cl
autocmd Filetype tex inoremap $beg \begin{°}<Enter><Enter><Enter><Enter>\end{°}<Esc>4kv4j:s/°/
autocmd Filetype tex inoremap $list \begin{itemize}<Enter><Enter>\item ° <Enter><Enter>\end{itemize}<Enter><Enter><++><Esc>4k0f°cl
autocmd Filetype tex inoremap $item <Enter>\item<Esc>A
autocmd Filetype tex inoremap $£ <++>
autocmd Filetype tex inoremap $quote \begin{quote}<Enter><Enter><Enter><Enter>\label{<++>}<Enter>\end{quote}<Enter><Enter><++><Esc>5kI
autocmd Filetype tex inoremap $href \href{°}{<++>}<Esc>F°cl
autocmd Filetype tex inoremap $fb \textbf{°} <++><Esc>F°cl
autocmd Filetype tex inoremap $fi \textit{°} <++><Esc>F°cl
autocmd Filetype tex inoremap $fu \underline{°} <++><Esc>F°cl


"html

autocmd Filetype html inoremap $p <p>°</p><Enter><Enter><++><Esc>2k0f°cl
autocmd Filetype html inoremap $h1 <h1>°</h1><Enter><Enter><++><Esc>2k0f°cl
autocmd Filetype html inoremap $h2 <h2>°</h2><Enter><Enter><++><Esc>2k0f°cl
autocmd Filetype html inoremap $h3 <h3>°</h3><Enter><Enter><++><Esc>2k0f°cl
autocmd Filetype html inoremap $b <b>°</b><Enter><Enter><++><Esc>2k0f°cl
autocmd Filetype html inoremap $em <em>°</em><Enter><Enter><++><Esc>2k0f°cl
autocmd Filetype html inoremap $i <i>°</i><Enter><Enter><++><Esc>2k0f°cl
autocmd Filetype html inoremap $u <u>°</u><Enter><Enter><++><Esc>2k0f°cl
autocmd Filetype html inoremap $li <li>°</li><Enter><Enter><++><Esc>2k0f°cl
autocmd Filetype html inoremap $ol <ol><Enter><Enter><li>°</li><Enter><Enter></ol><Enter><++><Esc>3k0f°cl
autocmd Filetype html inoremap $ul <ul><Enter><Enter><li>°</li><Enter><Enter></ul><Enter><++><Esc>3k0f°cl







" turen of conceal highlichts
hi clear Conceal
