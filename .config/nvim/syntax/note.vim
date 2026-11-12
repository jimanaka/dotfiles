if exists("b:current_syntax")
  finish
endif

" ---- Target/IP highlighting (handy for HTB notes) ----
syntax match noteIP /\v<\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}>/
highlight link noteIP Special

" ---- Comments ----
syntax match noteComment /\/\/.*/
syntax match noteComment /\#.*/
highlight link noteComment Comment

" ---- Folds ----
syntax match foldThing /^=\{48\}$/
syntax match foldThing /^\(\/\\\)\{24\}$/
syntax match foldThing /{{{$/
syntax match foldThing /}}}$/
highlight link foldThing Special

" ---- Timestamp ----
syntax match noteTimestamp /^\d\{4\}-\d\{2\}-\d\{2\} \d\{2\}:\d\{2\} -- /
highlight link noteTimestamp Identifier

" ---- Strings ----
syntax match noteString /".*"/
syntax match noteString /'.*'/
highlight link noteString String

let b:current_syntax = "note"
