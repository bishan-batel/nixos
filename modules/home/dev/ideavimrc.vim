
let g:mapleader = " "

" Highlight copied text
" call plug#begin()
Plug 'machakann/vim-highlightedyank'
" Commentary plugin
Plug 'tpope/vim-commentary'
Plug 'preservim/nerdtree'
Plug 'vim-scripts/argtextobj.vim'

" Plug 'machakann/vim-sandwich'
Plug 'rhysd/vim-operator-surround'
" call plug#end()

" sfdf
set mini-ai
set commentary
set which-key
set vim-operator-surround
set operator-surround


set ideajoin
set ideamark
set idearefactormode=keep

set notimeout
set timeoutlen=5000

set scrolloff=5

" Do incremental searching.
set incsearch
set hlsearch
set smartcase
set visualbell


set rnu
set number

vmap <leader>y "+y
nmap <leader>y "+yy

vmap <leader>p "+p
nmap <leader>p "+p

map <leader>ca <Action>(ShowIntentionActions)
map <leader>cg <Action>(Generate)
set number

map <leader>gg <Action>(Generate)
map <leader>sf <Action>(GotoFile)
map <leader>sa <Action>(SearchEverywhere)
map <leader>sg <Action>(TextSearchAction)
nmap <leader><leader> <C-Tab>

map <leader>rn <Action>(RenameElement)

nmap <leader>e <Action>(ShowErrorDescription)

map [e <Action>(GotoPrevError)
map ]e <Action>(GotoNextError)

"" -- Map IDE actions to IdeaVim -- https://jb.gg/abva4t
"" Map \r to the Reformat Code action
map <leader>f <Action>(ReformatCode)

"" Map <leader>d to start debug
map <leader>od <Action>(Debug)

"" Map <leader>d to start debug
map <leader>or <Action>(Run)

"" Map \b to toggle the breakpoint on the current line
map <leader>cb <Action>(ToggleLineBreakpoint)

nnoremap <C-\> :NERDTreeToggle<cr>

set NERDTree
let g:NERDTreeMapActivateNode='l'
let g:NERDTreeMapJumpParent='h'

nmap <leader><C-1> :action SetHarpoon1<cr>
nmap <leader><C-2> :action SetHarpoon2<cr>
nmap <leader><C-3> :action SetHarpoon3<cr>
nmap <leader><C-4> :action SetHarpoon4<cr>
nmap <leader>1 :action GotoHarpoon1<cr>
nmap <leader>2 :action GotoHarpoon2<cr>
nmap <leader>3 :action GotoHarpoon3<cr>
nmap <leader>4 :action GotoHarpoon4<cr>

nmap <leader>e :action ShowHarpoon<cr>
nmap <leader>a :action AddToHarpoon<cr>



" set quickscope


":vim ft=vim:
