" Vim indent file
" Language:     OAL (Object Action Language)(TM)
" Maintainer:   Lee Riemenschneider <lwriemen@frogooa.com>
" Last Change:  2004 Dec 10
" Use:          OAL is used with the BridgePoint UML tool
" Trademark:    Object Action Language is a trademark and 
"               BridgePoint is a registered trademark of 
"               Project Technology, Inc.

" Only load this indent file when no other was loaded.
if exists("b:did_indent")
  finish
endif
let b:did_indent = 1

setlocal indentkeys=o,=else,=elif,=end\ if,=end\ for,=end\ while

" Set the function to do the work.
setlocal indentexpr=GetOalIndent()

function s:GetOalIndent()
  let ind = indent(v:lnum)
  let lnum = prevnonblank(v:lnum - 1)
  let prevline = getline(lnum)

  "Add a shiftwidth to statements following if, else, elif,
  "while and for each statements
  if prevline =~ '^\s*\(if\|else\|elif\|while\|for\ each\)\>'
     "Don't add shiftwidth if already present
     "Prevents indentkeys from adding unwanted indentions
     let pind = indent(lnum)
     if pind == ind
      let ind = ind + &sw
     endif
  endif

  "Subtract a shiftwidth from else, elif, end if, end for,
  "and end while statements
  if getline(v:lnum) =~ '^\s*\(else\|elif\|end\s*\(if\|while\|for\)\)\>'
    let ind = ind - &sw
  endif

  return ind
endfunction

