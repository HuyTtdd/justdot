let s:cpo_save = &cpo
set cpo&vim

" }}}
" Highlighting: {{{
" -----------------------------------------------------------------------------
" Sync at the beginning of class, function or method definition
" syn sync match TSSync grouphere NONE "^\s*\%(def\|class\)\s\+\h\w*\s*("
syn sync match TSSync grouphere NONE '):$'
hi def link TSStatement Statement
hi def link TSConditional Conditional
hi def link TSRepeat Repeat
hi def link TSException Exception
hi def link TSOperator Statement
hi def link TSAsync TSStatement
hi def link TSSelf StorageClass
hi def link TSInclude Include
hi def link TSDecorator Decorators
" hi def link TSDottedName Function
" hi def link TSClass TSClass
hi def link TSClass Function
hi def link TSFunction Function
hi def link TSFunctionCall TSFunction
hi def link TSFunctionParameter Type
hi def link TSLambdaParameter TSFunctionParameter
hi def link TSFunctionKeyword TSFunctionParameter
hi def link TSTypeHint TSFunctionParameter
hi def link @comment String
hi def link TSTodo Todo
hi def link TSBoolean Number
hi def link TSNone TSBoolean

hi def link TSBuiltinObj StorageClass
hi def link TSBuiltinFunc Function

hi def link TSString String
hi def link TSRawString TSString
hi def link TSRawEscape Special
hi def link TSUniEscape Special
hi def link TSUniEscapeError Error
hi def link TSBytes TSString
hi def link TSRawBytes TSString
hi def link TSBytesContent TSString
hi def link TSBytesError Error
hi def link TSEscape Special
hi def link TSEscapeError Error
hi def link TSFString TSString
hi def link TSRawFString TSString
" hi def link TSStrInterpRegion Special

hi def link TSStrFormatting Special
hi def link TSStrFormat Special
hi def link TSStrTemplate Special
hi def link TSDocTest Special
hi def link TSDocTest2 Special

hi def link TSNumber Number
hi def link TSHexNumber Number
hi def link TSOctNumber Number
hi def link TSBinNumber Number
hi def link TSFloat Float
hi def link TSNumberError Error
hi def link TSOctError Error
hi def link TSHexError Error
hi def link TSBinError Error

hi def link TSColon Delimiter

let b:current_syntax="TS"
let &cpo=s:cpo_save
unlet s:cpo_save

" }}}
" vim: set sw=4 ts=4 sts=4 et tw=80 ft=vim fdm=marker

