"Import
" syntax region  typescriptImportDef             start=/\<import\>/ end=/;\|['"])\?\s*$/ contains=typescriptImport,typescriptString,typescriptBlock keepend
syntax keyword typescriptImport                from as import
syntax keyword typescriptExport                export module

"this

"JavaScript Prototype
syntax keyword typescriptPrototype             prototype
  \ nextgroup=typescriptDotNotation

syntax keyword typescriptCastKeyword           as
  \ nextgroup=@typescriptType
  \ skipwhite

"Program Keywords
syntax keyword typescriptIdentifier            arguments this super
  \ nextgroup=typescriptDotNotation

syntax keyword typescriptVariable              let var const
  \ nextgroup=typescriptVariableDeclaration
  \ skipwhite skipempty skipnl

syntax keyword typescriptEnumKeyword const
  \ nextgroup=typescriptEnum,typescriptVariableDeclaration
  \ skipwhite

syntax region typescriptEnum matchgroup=typescriptEnumKeyword start=/enum / end=/\ze{/
  \ nextgroup=typescriptBlock
  \ skipwhite

syntax region typescriptEnum matchgroup=typescriptEnumKeyword start=/namespace / end=/\ze{/
  \ nextgroup=typescriptBlock
  \ skipwhite

syntax match typescriptVariableDeclaration /[A-Za-z_$]\k*/
  \ nextgroup=typescriptTypeAnnotation,typescriptAssign
  \ contained skipwhite skipempty skipnl

syntax keyword typescriptKeywordOp
  \ contained in instanceof nextgroup=@typescriptValue
syntax keyword typescriptOperator              delete new typeof void
  \ nextgroup=@typescriptValue
  \ skipwhite skipempty
syntax keyword typescriptForOperator           contained in of
syntax keyword typescriptBoolean               true false nextgroup=@typescriptSymbols skipwhite skipempty
syntax keyword typescriptNull                  null undefined nextgroup=@typescriptSymbols skipwhite skipempty
syntax keyword typescriptMessage               alert confirm prompt status
  \ nextgroup=typescriptDotNotation,typescriptFuncCallArg
syntax keyword typescriptGlobal                self top parent
  \ nextgroup=typescriptDotNotation

"Statement Keywords
syntax keyword typescriptConditional           if else switch
  \ nextgroup=typescriptConditionalParen
  \ skipwhite skipempty skipnl
syntax keyword typescriptConditionalElse       else
syntax keyword typescriptRepeat                do while for nextgroup=typescriptLoopParen skipwhite skipempty
syntax keyword typescriptRepeat                for nextgroup=typescriptLoopParen,typescriptAsyncFor skipwhite skipempty
syntax keyword typescriptBranch                break continue
syntax keyword typescriptCase                  case nextgroup=@typescriptPrimitive skipwhite
syntax keyword typescriptDefault               default nextgroup=@typescriptValue,typescriptClassKeyword skipwhite oneline
syntax keyword typescriptStatementKeyword      with yield
syntax keyword typescriptStatementKeyword      return skipwhite contained nextgroup=@typescriptValue containedin=typescriptBlock

syntax keyword typescriptTry                   try
syntax keyword typescriptExceptions            catch throw finally
syntax keyword typescriptDebugger              debugger

syntax keyword typescriptAsyncFor              await nextgroup=typescriptLoopParen skipwhite skipempty contained

syntax region  typescriptLoopParen             contained matchgroup=typescriptParens
  \ start=/(/ end=/)/
  \ contains=typescriptVariable,typescriptForOperator,typescriptEndColons,@typescriptValue nextgroup=typescriptBlock
  \ skipwhite skipempty
syntax region  typescriptConditionalParen             contained matchgroup=typescriptParens start=/(/ end=/)/ contains=@typescriptValue nextgroup=typescriptBlock skipwhite skipempty
syntax match   typescriptEndColons             /[;,]/
