"customization{{{
set hlsearch
set cursorline

"syntax highlighting
syn on
"set the tab width to 2 spaces
set shiftwidth=2 softtabstop=2 expandtab   
"shows the numbers
set nu
"set so if you press option you can use you mouse
set mouse=a
"makes the plugin spellcheck work(i made spellcheck)
set spell
"displays the ruler
set ruler

"}}}
"other{{{
"set color column=80
echo expand("%")
echo ""
nnoremap <enter> zak<cr>
set foldmethod=marker
"}}}
"plugins and sources{{{
so ~/.vim/colors/color.vim "same code as my color scheme section(deleted)
"so ~/.vim/startup/vim-spelling/spellcheck.vim
"so ~/.vim/startup/function-py/Add/Add.vim "same code as add section
"so ~/.vim/startup/function-py/clear/clear.vim "same code as clear section
"so ~/.vim/startup/function-py/html/html.vim "same code as html section 
"so ~/.vim/.shortcuts.vim
nnoremap ; :
"}}}
"python con fig{{{
python import vim
"}}}
"filename styling{{{
if &laststatus < 2
  set laststatus=2
endif

silent doautocmd User AirlineToggledOn


function! s:get_airline_themes(a, l, p)
let files = split(globpath(&rtp, 'autoload/airline/themes/'.a:a.'*'), "\n")
return map(files, 'fnamemodify(v:val, ":t:r")')
endfunction

function! s:airline_theme(...)
  if a:0
call airline#switch_theme(a:1)
  else
  echo g:airline_theme
  endif
  endfunction

  function! s:airline_refresh()
  if !exists("#airline")
  return
  endif
  let nomodeline=''
  if v:version > 703 || v:version == 703 && has("patchier")
  let nomodeline = '<nomodeline>'
  endif
  exe printf("silent do AutoCAD %s User Airline Before Refresh", nomodeline)
  call airline#highlighter#reset_hlcache()
  call airline#load_theme()
call airline#update_statusline()
  endfunction

  command! -bar -nargs=? -complete=customlist,<sid>get_airline_themes AirlineTheme call <sid>airline_theme(<f-args>)
command! -bar AirlineToggleWhitespace call airline#extensions#whitespace#toggle()
  command! -bar AirlineToggle call s:airline_toggle()
  command! -bar AirlineRefresh call s:airline_refresh()
"}}}
"overall styles{{{
"}}}
"spelling{{{
"spellcheck{{{
nnoremap s [s1z=
"}}}
"}}}
"navigation{{{
vsp|find .
nnoremap :f :vsp|find .
"}}}
"editing{{{
autocmd SwapExists * let v:swapchoice='e'
"}}}
"markdown{{{
nnoremap m1 yy$pVr=
nnoremap m2 yy$pVr-
nnoremap m3 01###<esc>
"}}}
"lists{{{
nnoremap lc 0i--<esc>f,xi<enter><esc>
"}}}
"coding{{{
nnoremap sop :so %
nnoremap sov :so ~/.vimrc
nnoremap fic :find ~/.vim/colors/color.vim
"html{{{
inoremap ;h2 <h2></h2>  <esc>hhhhho<enter><!--<++>--><esc>kkli
inoremap ;p <p></p> <esc>hhhho<enter><!--<++>--><esc>kkhhhhi
inoremap ;div <div></div> <esc>hhhhhho<enter><!--<++>--><esc>kkhhhhhi
inoremap ;span <span></span> <esc>hhhhhhho<enter><!--<++>--><esc>kkhhhhi
inoremap ;sec <section></section> <esc>hhhhhhhhhho<enter><!--<++>--><esc>kkhi
inoremap ;ft <footer></footer> <esc>hhhhhhhhho<enter><!--<++>--><esc>kkhhi
inoremap ;c  class="" <esc>hi
inoremap ;id  id="" <esc>hi
inoremap <space><space> <esc>/<!--<++>--><enter>"_c12l
inoremap ;ul <ul></ul> <esc>hhhhho<enter><!--<++>--><esc>kkhhhhhhi
inoremap ;li <li></li> <esc>o<enter><!--<++>--><esc>kkhhhhhi
inoremap ;hd <header></header> <esc>hhhhhhhhho<enter><!--<++>--><esc>kkhi
inoremap ;nav <nav></nav> <esc>o<enter><!--<++>--><esc>kkhhhhhi
inoremap ;css <style></style> <esc>hhhhhhhhi
inoremap ;js <script></script> <esc>hhhhhhhhhi
inoremap begin begin<enter> <enter>end<esc>ki
inoremap { {}<esc>hi
inoremap ;a <a href=""></a><esc>hhho<enter><!--<++>--><esc>kkhi
inoremap ;html <html><enter><head><enter><title></title><enter></head><enter><body><enter></body><enter></html>
inoremap ;lb <label></label><esc>hhhhhhhho<enter><!--<++>--><esc>kkhhhi
inoremap ;em <em></em> <esc>hhhho<enter><!--<++>--><esc>kkhhhhhi
inoremap ;b <strong></strong> <esc>hhhhhhhhho<esc>klllllllli
inoremap ;wd width="px" <esc>hhhi
inoremap ;s <esc>:w<cr>i
"}}}
"latex{{{
autocmd filetype tex inoremap ;tex \documentclass{article}<enter>\begin{document}\end{document}
"}}}
vnoremap v <esc>v
"}}}
"python{{{
"add{{{
python import vim
function! Add()
python << endOfPython
num =int(vim.current.buffer[:][0])+int(vim.current.buffer[:][1])
print(num);
endOfPython
endfunction
"}}}
"html{{{
python import vim
function! Html()
python << endOfPython
vim.current.buffer[:]=["<html>","<head>","<title></title>","</head>","<body>","</body>","</html>"]
endOfPython
endfunction
command! Html call Html()
"}}}
"clear{{{
python import vim
function! Clear()
python << endOfPython
vim.current.buffer[:]=[""]
endOfPython
endfunction
command! Clear call Clear()
"}}}
"}}}


nnoremap <F5> :!open -a /Applications/Google\ Chrome.app/ %<cr>

