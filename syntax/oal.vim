" Vim syntax file
" Language:     OAL (Object Action Language)(TM)
" Maintainer:   Lee Riemenschneider <lwriemen@frogooa.com>
" Last Change:  2004 Mar 31
" Use:          OAL is used with the BridgePoint UML tool
" Trademark:    Object Action Language is a trademark and 
"               BridgePoint is a registered trademark of 
"               Project Technology, Inc.

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" A bunch of useful OAL keywords
syn keyword     oalStatement    
   \ . across
   \ . any
   \ . by
   \ . cardinality
   \ . continue
   \ . create
   \ . creator
   \ . delete
   \ . each
   \ . elif
   \ . else
   \ . empty
   \ . end
   \ . event
   \ . for
   \ . from
   \ . generate
   \ . if
   \ . in
   \ . instance
   \ . instances
   \ . many
   \ . not_empty
   \ . object
   \ . of
   \ . one
   \ . param
   \ . rcvd_evt
   \ . relate
   \ . related
   \ . return
   \ . select
   \ . selected
   \ . self
   \ . to
   \ . transform
   \ . unrelate
   \ . using
   \ . where
   \ . while

syn keyword     oalBoolean      true false TRUE FALSE
syn keyword     oalOptional     assign bridge
syn keyword     oalOperators    and not or == != < <= > >= + - = / * % ' "
syn keyword     oalEmphasis     contained CONSTANT ASSUMPTION NOTE REQUIREMENT
syn region	oalString       start=+"+ skip=+\\"+ end=+"+
syn region	oalTicks        start=+'+ skip=+\\'+ end=+'+
" oalCommentGroup allows adding matches for special things in comments
syn cluster	oalCommentGroup	contains=oalEmphasis
syn region	oalComment      start="//" skip="\\$" end="$" keepend contains=@oalCommentGroup

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_c_syn_inits")
  if version < 508
    let did_c_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink oalStatement   Statement
  HiLink oalBoolean     Boolean
  HiLink oalOptional    Special
  HiLink oalOperators   Operator
  HiLink oalEmphasis    Todo
  HiLink oalComment     Comment
  HiLink oalString      String
  HiLink oalTicks       String

  delcommand HiLink
endif

let b:current_syntax = "oal"

" vim: ts=8
