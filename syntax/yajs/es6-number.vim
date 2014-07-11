syntax keyword javascriptGlobal Number
syntax keyword javascriptNumberProp contained EPSILON MAX_SAFE_INTEGER MAX_VALUE MIN_SAFE_INTEGER
syntax keyword javascriptNumberProp contained MIN_VALUE NEGATIVE_INFINITY NaN POSITIVE_INFINITY
syntax cluster props add=javascriptNumberProp
if exists("did_javascript_hilink") | HiLink javascriptNumberProp Keyword
endif
syntax keyword javascriptNumberMethod contained isFinite isInteger isNaN isSafeInteger nextgroup=javascriptFuncCallArg
syntax keyword javascriptNumberMethod contained parseFloat parseInt toExponential nextgroup=javascriptFuncCallArg
syntax keyword javascriptNumberMethod contained toFixed toLocaleString toPrecision nextgroup=javascriptFuncCallArg
syntax keyword javascriptNumberMethod contained toSource toString valueOf nextgroup=javascriptFuncCallArg
syntax cluster props add=javascriptNumberMethod
if exists("did_javascript_hilink") | HiLink javascriptNumberMethod Keyword
endif
