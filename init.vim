" https://neovim.io/doc/user/usr_05.html#vimrc-intro
set number
set ignorecase
set backspace=indent,eol,start
set autoindent
set ruler
set showcmd
set incsearch
map Q gq
syntax on
set hlsearch
filetype plugin indent on
autocmd FileType text setlocal textwidth=80



" https://github.com/k-takata/minpac
" minpac doesn't need to be loaded every time. Unlike other plugin managers, it is needed only when updating, installing or cleaning the plugins. This is because minpac itself doesn't handle the runtime path.
" packadd minpac

if exists('*minpac#init')
  " minpac is loaded.
  call minpac#init()
  " minpac must have {'type': 'opt'} so that it can be loaded with `packadd`.
  call minpac#add('k-takata/minpac', {'type': 'opt'})
  " Add other plugins here.
  call minpac#add('vim-jp/syntax-vim-ex')
  call minpac#add('junegunn/fzf.vim')
  call minpac#add('itchyny/lightline.vim')
  call minpac#add('w0rp/ale')
  call minpac#add('maximbaz/lightline-ale')
  call minpac#add('itchyny/vim-gitbranch')
  call minpac#add('airblade/vim-gitgutter')
  call minpac#add('scrooloose/nerdtree')
  call minpac#add('terryma/vim-multiple-cursors')
  " Load the plugins right now. (optional)
  " "start" plugins will be automatically loaded after processing your .vimrc, or you can load them explicitly using :packloadall command. "opt" plugins can be loaded with :packadd command. See :help packages for detail.
  " packloadall
else
endif

" Define user commands for updating/cleaning the plugins.
" Each of them loads minpac, reloads .vimrc to register the
" information of plugins, then performs the task.
command! PackUpdate packadd minpac | source $MYVIMRC | call minpac#update('', {'do': 'call minpac#status()'})
command! PackClean  packadd minpac | source $MYVIMRC | call minpac#clean()
command! PackStatus packadd minpac | source $MYVIMRC | call minpac#status()

" if you make it reloadable, you can apply the changes to the .vimrc immediately by executing :so $MYVIMRC | PackUpdate.

function! PackList(...)
  call PackInit()
  return join(sort(keys(minpac#getpluglist())), "\n")
endfunction

" If you execute :PackOpenDir minpac, it will open a terminal window at ~/.vim/pack/minpac/opt/minpac (or the directory where minpac is installed).
command! -nargs=1 -complete=custom,PackList
      \ PackOpenDir call PackInit() | call term_start(&shell,
      \    {'cwd': minpac#getpluginfo(<q-args>).dir,
      \     'term_finish': 'close'})

" a command to open the repository of a plugin in a web browser:
command! -nargs=1 -complete=custom,PackList
      \ PackOpenUrl call PackInit() | call openbrowser#open(
      \    minpac#getpluginfo(<q-args>).url)



" https://github.com/junegunn/fzf#as-vim-plugin
" fzf - adding the directory to &runtimepath
set rtp+=/usr/local/opt/fzf
nnoremap ; :Files<CR>



set laststatus=2
let g:lightline = {
\   'active': {
\     'left': [
\       ['mode', 'paste' ],
\       ['gitbranch', 'readonly', 'relativepath', 'modified'],
\     ],
\     'right': [
\       ['lineinfo'],
\       ['percent'],
\       ['fileformat', 'fileencoding'],
\       ['linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok'],
\       ['charvaluehex', 'charvalue', 'helloworld'],
\     ]
\   },
\   'component': {
\     'helloworld': 'biu',
\     'charvaluehex': '0x%B',
\   },
\   'component_function': {
\     'gitbranch': 'gitbranch#name',
\   },
\   'component_expand': {
\     'linter_checking': 'lightline#ale#checking',
\     'linter_warnings': 'lightline#ale#warnings',
\     'linter_errors': 'lightline#ale#errors',
\     'linter_ok': 'lightline#ale#ok',
\   },
\   'component_type': {
\     'linter_checking': 'left',
\     'linter_warnings': 'warning',
\     'linter_errors': 'error',
\     'linter_ok': 'left',
\   },
\}
set noshowmode
" let g:lightline#ale#indicator_checking = "\uf110"
" let g:lightline#ale#indicator_warnings = "\uf071 "
" let g:lightline#ale#indicator_errors = "\uf05e "
" let g:lightline#ale#indicator_ok = "\uf00c"



" open a NERDTree automatically when vim starts up
" autocmd vimenter * NERDTree



" https://github.com/airblade/vim-gitgutter
set updatetime=100



" https://github.com/w0rp/ale
" By default, all available tools for all supported languages will be run. If you want to only select a subset of the tools, you can define b:ale_linters for a single buffer, or g:ale_linters globally.
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'css': ['stylelint'],
\   'pcss': ['stylelint'],
\   'postcss': ['stylelint'],
\}
" \   '*': ['remove_trailing_lines', 'trim_whitespace'],
let g:ale_fixers = {
\   'javascript': ['prettier-eslint'],
\   'css': ['prettier', 'stylelint'],
\   'pcss': ['prettier', 'stylelint'],
\   'postcss': ['prettier', 'stylelint']
\}
" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 1
" Enable completion where available.
let g:ale_completion_enabled = 1
" By default, the sign gutter will disappear when all warnings and errors have
" been fixed for a file. When this option is set to `1`, the sign column will
" remain open. This can be preferable if you don't want the text in your file
" to move around as you edit a file.
let g:ale_sign_column_always = 1
" https://github.com/w0rp/ale#5x-how-can-i-run-linters-only-when-i-save-files
" let g:ale_lint_on_text_changed = 'never'
" change the format for echo messages
let g:ale_echo_msg_format = '[%linter%] [%severity%] %code: %%s'




" mapping
" https://medium.com/vim-drops/understand-vim-mappings-and-create-your-own-shortcuts-f52ee4a6b8ed
nnoremap ,<space> :nohlsearch<CR>
" https://github.com/w0rp/ale#5ix-how-can-i-navigate-between-errors-quickly
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
