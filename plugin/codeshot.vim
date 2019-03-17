" Vim plugin to take 'screenshots' of your code
" Author: Diego Guerra <https://github.com/dgsuarez>
" License: www.opensource.org/licenses/bsd-license.php

if exists("loaded_codeshot")
  finish
endif
let loaded_codeshot = 1

function s:Codeshot() range
  let pipeline = filter([s:Pygmentize(), s:Trim(), s:CopyToClipboard()], 'len(v:val)')
  let command = join(pipeline, ' | ')

  let code = join(getline(a:firstline, a:lastline), "\n")

  echo system(command, code)
endfunction

function s:Pygmentize()
  return 'pygmentize -f png ' . s:OutputOptions() . s:LanguageOption()
endfunction

function s:OutputOptions()
  let style = get(g:, 'CodeshotStyle', 'trac')
  let font_size = get(g:, 'CodeshotFontSize', 32)
  let line_numbers = get(g:, 'CodeshotShowLineNumbers', 0)

  if l:line_numbers
    let line_numbers='True'
  else
    let line_numbers='False'
  endif

  return '-O full,style=' . style .',font_size=' . font_size . ',line_numbers=' . line_numbers
endfunction

function s:LanguageOption()
  if &filetype == ''
    return ''
  endif

  return ' -l ' . &filetype
endfunction

function s:Trim()
  let trim = get(g:, 'CodeshotTrim', 1)
  let trim_exists = executable('convert')

  if trim && trim_exists
    return 'convert png:- -trim png:-'
  endif

  return ''
endfunction

function s:CopyToClipboard()
  return  'xclip -selection clipboard -t image/png'
endfunction

command! -range=% -nargs=0 Codeshot :<line1>,<line2>call s:Codeshot()
