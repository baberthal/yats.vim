" Vim syntax file
" Language:     TypeScript
" Maintainer:   Herrington Darkholme
" Last Change:  2015-04-05
" Version:      1.0
" Changes:      Go to https:github.com/HerringtonDarkholme/yats.vim for recent changes.
" Origin:       https://github.com/othree/yajs
" Credits:      Kao Wei-Ko(othree), Jose Elera Campana, Zhao Yi, Claudio Fleiner, Scott Shattuck
"               (This file is based on their hard work), gumnos (From the #vim
"               IRC Channel in Freenode)


if !exists("main_syntax")
  if exists("b:current_syntax")
    finish
  endif
  let main_syntax = 'typescript'
endif

" Define the default highlighting.
" For version 5.8 and later: only when an item doesn't have highlighting yet
let did_typescript_hilink = 1
command -nargs=+ HiLink hi def link <args>

"Dollar sign is permitted anywhere in an identifier
setlocal iskeyword-=$
if main_syntax == 'typescript'
  setlocal iskeyword+=$
  syntax cluster htmlJavaScript                 contains=TOP
endif

syntax sync fromstart

" lowest priority on least used feature
syntax match   typescriptLabel                /[a-zA-Z_$]\k*:/he=e-1 contains=typescriptReserved nextgroup=@typescriptStatement skipwhite skipempty
" syntax region  typescriptBlock                 matchgroup=typescriptBraces start=/\([\^:]\s\*\)\=\zs{/ end=/}/ contains=@htmlJavaScript fold
syntax region  typescriptBlock                 matchgroup=typescriptBraces start=/{/ end=/}/ contains=@typescriptStatement,@typescriptComments fold

runtime syntax/basic/identifiers.vim
runtime syntax/basic/literal.vim
runtime syntax/basic/object.vim

runtime syntax/basic/symbols.vim
runtime syntax/basic/reserved.vim
runtime syntax/basic/keyword.vim
runtime syntax/basic/doc.vim
runtime syntax/basic/type.vim

" extension
runtime syntax/yats.vim

" patch
runtime syntax/basic/patch.vim
runtime syntax/basic/method.vim
runtime syntax/basic/class.vim
runtime syntax/basic/forcomprehension.vim
<<<<<<< HEAD


syntax region  typescriptObjectLiteral         contained matchgroup=typescriptBraces start=/{/ end=/}/ contains=@typescriptComments,typescriptObjectLabel,typescriptPropertyName,typescriptMethodDef,typescriptComputedPropertyName,typescriptMethod,@typescriptValue fold

" syntax match   typescriptBraces                /[\[\]]/
" syntax match   typescriptParens                /[()]/
" syntax match   typescriptOpSymbols             /[^+\-*/%\^=!<>&|?]\@<=\(<\|>\|<=\|>=\|==\|!=\|===\|!==\|+\|-\|*\|%\|++\|--\|<<\|>>\|>>>\|&\||\|^\|!\|\~\|&&\|||\|?\|=\|+=\|-=\|*=\|%=\|<<=\|>>=\|>>>=\|&=\||=\|^=\|\/\|\/=\)\ze\_[^+\-*/%\^=!<>&|?]/ nextgroup=@typescriptExpression skipwhite
runtime syntax/basic/cluster.vim
runtime syntax/basic/function.vim
runtime syntax/basic/ambient.vim
runtime syntax/basic/decorator.vim

if exists("did_typescript_hilink")
  HiLink typescriptReserved             Error

  HiLink typescriptEndColons            Exception
  HiLink typescriptSymbols              Normal
  HiLink typescriptLogicSymbols         Boolean
  HiLink typescriptBraces               Function
  HiLink typescriptParens               Normal
  HiLink typescriptComment              Comment
  HiLink typescriptLineComment          Comment
  HiLink typescriptDocComment           Comment
  HiLink typescriptCommentTodo          Todo
  HiLink typescriptRef                  Include
  HiLink typescriptDocNotation          SpecialComment
  HiLink typescriptDocTags              SpecialComment
  HiLink typescriptDocNGParam           typescriptDocParam
  HiLink typescriptDocParam             Function
  HiLink typescriptDocNumParam          Function
  HiLink typescriptDocEventRef          Function
  HiLink typescriptDocNamedParamType    Type
  HiLink typescriptDocParamName         Type
  HiLink typescriptDocParamType         Type
  HiLink typescriptDelimiter            Delimiter
  HiLink typescriptString               String
  HiLink typescriptStringDelimiter      typescriptDelimiter
  HiLink typescriptTemplate             String
  HiLink typescriptEventString          String
  HiLink typescriptASCII                Special
  HiLink typescriptTemplateSB           Label
  HiLink typescriptTemplateTag          Identifier
  HiLink typescriptRegexpDelimiter      typescriptDelimiter
  HiLink typescriptRegexpEscape         typescriptRegexpSpecial
  HiLink typescriptRegexpQuantifier     typescriptRegexpSpecial
  HiLink typescriptRegexpAnchor         typescriptRegexpSpecial
  HiLink typescriptRegexpDot            typescriptRegexpCharClass
  HiLink typescriptRegexpCharClass      typescriptRegexpSpecial
  HiLink typescriptRegexpSpecial        Special
  HiLink typescriptRegexp               typescriptString
  HiLink typescriptGlobal               Constant
  HiLink typescriptCharacter            Character
  HiLink typescriptPrototype            Type
  HiLink typescriptConditional          Conditional
  HiLink typescriptConditionalElse      Conditional
  HiLink typescriptCase                 Conditional
  HiLink typescriptDefault              typescriptCase
  HiLink typescriptBranch               Conditional
  HiLink typescriptIdentifier           Structure
  HiLink typescriptVariable             Identifier
  HiLink typescriptEnumKeyword          Identifier
  HiLink typescriptRepeat               Repeat
  HiLink typescriptForComprehension     Repeat
  HiLink typescriptIfComprehension      Repeat
  HiLink typescriptOfComprehension      Repeat
  HiLink typescriptForOperator          Repeat
  HiLink typescriptStatementKeyword     Statement
  HiLink typescriptMessage              Keyword
  HiLink typescriptOperator             Identifier
  HiLink typescriptKeywordOp            Identifier
  HiLink typescriptCastKeyword          Special
  HiLink typescriptType                 Type
  HiLink typescriptNull                 Boolean
  HiLink typescriptNumber               Number
  HiLink typescriptExponent             Number
  HiLink typescriptBoolean              Boolean
  HiLink typescriptObjectLabel          typescriptLabel
  HiLink typescriptLabel                Constant
  HiLink typescriptPropertyName         Label
  HiLink typescriptImport               PreProc
  HiLink typescriptAmbientDeclaration   PreProc
  HiLink typescriptExport               PreProc
  HiLink typescriptGlobExport           PreProc
  HiLink typescriptAmbientExport        PreProc
  HiLink typescriptTry                  PreProc
  HiLink typescriptExceptions           PreProc

  HiLink typescriptMethodName           Function
  HiLink typescriptMembers              Function
  HiLink typescriptMethodAccessor       Operator

  HiLink typescriptAsyncFuncKeyword     Keyword
  HiLink typescriptAsyncFor             Keyword
  HiLink typescriptFuncKeyword          Keyword
  HiLink typescriptAsyncFunc            Keyword
  HiLink typescriptArrowFunc            Type
  HiLink typescriptFuncName             Function
  HiLink typescriptFuncArg              PreProc
  HiLink typescriptArrowFuncArg         typescriptFuncArg
  HiLink typescriptFuncComma            Operator

  HiLink typescriptClassKeyword         Keyword
  HiLink typescriptClassExtends         Keyword
  " HiLink typescriptClassName            Function
  HiLink typescriptAbstract             Special
  " HiLink typescriptClassHeritage        Function
  " HiLink typescriptInterfaceHeritage    Function
  HiLink typescriptClassStatic          StorageClass
  HiLink typescriptInterfaceKeyword     Keyword
  HiLink typescriptInterfaceExtends     Keyword
  HiLink typescriptInterfaceName        Function
  HiLink typescriptAliasName            typescriptInterfaceName
  HiLink typescriptAliasExtends         typescriptInterfaceExtends
  HiLink typescriptAliasTypeParameter   typescriptInterfaceTypeParameter
  HiLink typescriptAliasHeritage        typescriptInterfaceHeritage

  HiLink shellbang                      Comment

  HiLink typescriptTypeParameter         Identifier
  HiLink typescriptConstraint            Keyword
  HiLink typescriptPredefinedType        Type
  HiLink typescriptUnion                 Operator
  HiLink typescriptFuncTypeArrow         Function
  HiLink typescriptConstructorType       Function
  HiLink typescriptTypeQuery             Keyword
  HiLink typescriptAccessibilityModifier Keyword
  HiLink typescriptOptionalMark          PreProc
  HiLink typescriptFuncType              Special
  HiLink typescriptMappedIn              Special
  HiLink typescriptCall                  PreProc
  HiLink typescriptConstructSignature    Identifier
  HiLink typescriptPropertySignature     Label
  HiLink typescriptMethodSignature       Label
  HiLink typescriptAliasDeclaration      Identifier
  HiLink typescriptAliasKeyword          TypeDef
  HiLink typescriptUserDefinedKeyword    Keyword
  HiLink typescriptTypeReference         Identifier
  HiLink typescriptAmbientModifier       Keyword
  HiLink typescriptAmbientName           Identifier
  HiLink typescriptAmbientCtor           Keyword
  HiLink typescriptConstructor           Keyword
  HiLink typescriptDecorator             Special

  highlight link javaScript             NONE

  delcommand HiLink
  unlet did_typescript_hilink
endif

let b:current_syntax = "typescript"
if main_syntax == 'typescript'
  unlet main_syntax
endif
