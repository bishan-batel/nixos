
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

" set quickscope
