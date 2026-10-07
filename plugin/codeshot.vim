" Vim plugin to take 'screenshots' of your code
" Author: Diego Guerra <https://github.com/dgsuarez>
" License: www.opensource.org/licenses/bsd-license.php

if exists("loaded_codeshot")
  finish
endif
let loaded_codeshot = 1

function s:Codeshot() range
  let code = join(getline(a:firstline, a:lastline), "\n")

  echo system(s:Silicon(a:firstline), code)
endfunction

function s:Silicon(first_line)
  let style = get(g:, 'CodeshotStyle', 'Dracula')
  let font = get(g:, 'CodeshotFont', 'Hack')
  let font_size = get(g:, 'CodeshotFontSize', 32)

  let command = 'silicon --to-clipboard --theme ' . shellescape(style) . ' --font ' . shellescape(font . '=' . font_size)
  return command . s:LineNumberOptions(a:first_line) . s:LanguageOption()
endfunction

function s:LineNumberOptions(first_line)
  if get(g:, 'CodeshotShowLineNumbers', 0)
    return ' --line-offset ' . a:first_line
  endif

  return ' --no-line-number'
endfunction

" Extensions resolve more reliably than vim filetypes (javascriptreact, eruby...)
function s:LanguageOption()
  let language = expand('%:e')
  if language == ''
    let language = &filetype
  endif

  if language == ''
    return ''
  endif

  return ' -l ' . shellescape(language)
endfunction

command! -range=% -nargs=0 Codeshot :<line1>,<line2>call s:Codeshot()
