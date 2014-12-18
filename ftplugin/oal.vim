" Vim filetype plugin file
" Language:	OAL (Object Action Language)(TM)
" Maintainer:	Lee Riemenschneider <lwriemen@frogooa.com>
" Last Change:	2004 Apr 1
" Use:          OAL is used with the BridgePoint UML tool
" Trademark:    Object Action Language is a trademark and 
"               BridgePoint is a registered trademark of 
"               Project Technology, Inc.

" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
  finish
endif

" Don't load another plugin for this buffer
let b:did_ftplugin = 1

set cpo-=C

let b:undo_ftplugin = "setl cin< fo< com< tw< ff<"
	\ . "| if has('vms') | setl isk< | endif"

" setlocal lines=25
" setlocal columns=128
" setlocal tw=128

setlocal ff=unix

" Set 'formatoptions' to break comment lines but not other lines,
" and insert the comment leader when hitting <CR> or using "o".
setlocal fo-=t fo+=croql

" Set 'comments' to format dashed lists in comments.
setlocal comments=://

" Win32 can filter files in the browse dialog
if has("gui_win32") && !exists("b:browsefilter")
  if &ft == "oal"
    let b:browsefilter = "Object Action Language(TM) Files (*.oal)\t*.oal\n" .
	\ "OAL Files (*.oal)\t*.oal\n" .
	\ "All Files (*.*)\t*.*\n"
  endif
endif

