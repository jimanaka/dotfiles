if exists("b:current_syntax")
  finish
endif

" ---- Target/IP highlighting (handy for HTB notes) ----
syntax match opnoteIP /\v<\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}>/
highlight link opnoteIP Special

" ---- Comments ----
syntax match opnoteComment /\/\/.*/
syntax match opnoteComment /^\#.*/
highlight link opnoteComment Comment

" ---- Folds ----
syntax match foldThing /^=\{48\}$/
syntax match foldThing /^\(\/\\\)\{24\}$/
syntax match foldThing /{{{$/
syntax match foldThing /}}}$/
highlight link foldThing Special

" ---- Timestamp ----
syntax match opnoteTimestamp /^\d\{4\}-\d\{2\}-\d\{2\} \d\{2\}:\d\{2\} -- /
highlight link opnoteTimestamp Identifier

" ---- Strings ----
syntax match opnoteString /".*"/
syntax match opnoteString /'.*'/
highlight link opnoteString String

let b:current_syntax = "opnote"
