"Syntax in the JavaScript code

" String
syntax match   typescriptASCII                 contained /\\\d\d\d/

syntax region  typescriptTemplateSubstitution matchgroup=typescriptTemplateSB
  \ start=/\${/ end=/}/
  \ contains=@typescriptValue
  \ contained

syntax region  typescriptString matchgroup=typescriptStringDelimiter start=/\z(["']\)/  skip=/\\\\\|\\\z1\|\\\n/  end=/\z1\|$/ nextgroup=@typescriptSymbols skipwhite skipempty extend

syntax region  typescriptRegexp matchgroup=typescriptRegexpDelimiter start=+/\(/\|*\)\@!+ skip=+\\\\\|\\/+ end=+/[gimuy]*+ contains=@typescriptRegexpSpecial oneline

" From vim-ruby, adapted for JS
syntax region  typescriptRegexpParens	matchgroup=typescriptRegexpSpecial   start="(\(?:\|?<\=[=!]\|?>\|?<[a-z_]\w*>\|?[imx]*-[imx]*:\=\|\%(?#\)\@!\)" skip="\\)"  end=")"  contained transparent contains=@typescriptRegexpSpecial
syntax region  typescriptRegexpBrackets	matchgroup=typescriptRegexpCharClass start="\[\^\="								  skip="\\\]" end="\]" contained transparent contains=typescriptStringEscape,typescriptRegexpEscape,typescriptRegexpCharClass oneline
syntax match   typescriptRegexpCharClass	"\\[DdHhSsWw]"	       contained display
syntax match   typescriptRegexpCharClass	"\[:\^\=\%(alnum\|alpha\|ascii\|blank\|cntrl\|digit\|graph\|lower\|print\|punct\|space\|upper\|xdigit\):\]" contained
syntax match   typescriptRegexpEscape	"\\[].*?+^$|\\/(){}[]" contained
syntax match   typescriptRegexpQuantifier	"[*?+][?+]\="	       contained display
syntax match   typescriptRegexpQuantifier	"{\d\+\%(,\d*\)\=}?\=" contained display
syntax match   typescriptRegexpAnchor	"[$^]\|\\[ABbGZz]"     contained display
syntax match   typescriptRegexpDot	"\."		       contained display
syntax match   typescriptRegexpSpecial	"|"		       contained display
syntax match   typescriptRegexpSpecial	"\\[1-9]\d\=\d\@!"     contained display
syntax match   typescriptRegexpSpecial	"\\k<\%([a-z_]\w*\|-\=\d\+\)\%([+-]\d\+\)\=>" contained display
syntax match   typescriptRegexpSpecial	"\\k'\%([a-z_]\w*\|-\=\d\+\)\%([+-]\d\+\)\='" contained display
syntax match   typescriptRegexpSpecial	"\\g<\%([a-z_]\w*\|-\=\d\+\)>" contained display
syntax match   typescriptRegexpSpecial	"\\g'\%([a-z_]\w*\|-\=\d\+\)'" contained display

syntax cluster typescriptRegexpSpecial	      contains=typescriptRegexpSpecial,typescriptRegexpEscape,typescriptRegexpBrackets,typescriptRegexpCharClass,typescriptRegexpDot,typescriptRegexpQuantifier,typescriptRegexpAnchor,typescriptRegexpParens


syntax region  typescriptTemplate
  \ start=/`/  skip=/\\\\\|\\`\|\n/  end=/`\|$/
  \ contains=typescriptTemplateSubstitution
  \ matchgroup=typescriptStringDelimiter
  \ nextgroup=@typescriptSymbols
  \ skipwhite skipempty

"Array
syntax region  typescriptArray matchgroup=typescriptBraces
  \ start=/\[/ end=/]/
  \ contains=@typescriptValue,typescriptForComprehension,@typescriptComments
  \ nextgroup=@typescriptSymbols,typescriptDotNotation
  \ skipwhite skipempty

" Number
syntax match typescriptNumber /\<0[bB][01][01_]*\>/        nextgroup=@typescriptSymbols skipwhite skipempty
syntax match typescriptNumber /\<0[oO][0-7][0-7_]*\>/       nextgroup=@typescriptSymbols skipwhite skipempty
syntax match typescriptNumber /\<0[xX][0-9a-fA-F][0-9a-fA-F_]*\>/ nextgroup=@typescriptSymbols skipwhite skipempty
syntax match typescriptNumber /\d[0-9_]*\.\d[0-9_]*\|\d[0-9_]*\|\.\d[0-9]*/
  \ nextgroup=typescriptNumberExponent,@typescriptSymbols skipwhite skipempty
syntax match typescriptExponent /[eE][+-]\=\d[0-9]*\>/
  \ nextgroup=@typescriptSymbols skipwhite skipempty contained
