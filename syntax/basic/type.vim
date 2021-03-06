" Types
syntax match typescriptOptionalMark /?/ contained

syntax region typescriptTypeParameters matchgroup=typescriptTypeBrackets
  \ start=/</ end=/>/ skip=/\s*,\s*/
  \ contains=typescriptTypeParameter
  \ contained

syntax match typescriptTypeParameter /[A-Za-z_$]\w*/
  \ nextgroup=typescriptConstraint
  \ contained skipwhite skipnl

syntax keyword typescriptConstraint extends
  \ nextgroup=@typescriptType
  \ contained skipwhite skipnl

"><
syntax region typescriptTypeArguments matchgroup=typescriptTypeBrackets
  \ start=/\></ end=/>/ skip=/\s*,\s*/
  \ contains=@typescriptType
  \ nextgroup=typescriptUnionOrArrayType,typescriptFuncCallArg
  \ contained skipwhite

syntax region typescriptTypeCast matchgroup=typescriptTypeBrackets
  \ start=/< \@!/ end=/>/ skip=/\s*,\s*/
  \ contains=@typescriptType
  \ nextgroup=@typescriptValue
  \ contained skipwhite oneline

syntax cluster typescriptType contains=
  \ @typescriptCompoundType,
  \ @typescriptFunctionType,
  \ typescriptConstructorType

syntax cluster typescriptCompoundType contains=
  \ @typescriptPrimaryType,
  \ typescriptUnionOrArrayType

syntax cluster typescriptPrimaryType contains=
  \ typescriptParenthesizedType,
  \ typescriptPredefinedType,
  \ typescriptTypeReference,
  \ typescriptObjectType,
  \ typescriptTupleType,
  \ typescriptTypeQuery,
  \ typescriptString

syntax region typescriptParenthesizedType matchgroup=typescriptParens
  \ start=/(/ end=/)/
  \ contains=@typescriptType
  \ nextgroup=typescriptUnionOrArrayType
  \ contained skipwhite skipempty

syntax keyword typescriptPredefinedType any number boolean string void never undefined null object
  \ nextgroup=typescriptUnionOrArrayType
  \ contained skipwhite skipempty

syntax match typescriptTypeReference /[A-Za-z_$]\w*\(\.[A-Za-z_$]\w*\)*/
  \ nextgroup=typescriptTypeArguments,typescriptUnionOrArrayType
  \ skipwhite contained skipempty

syntax region typescriptObjectType matchgroup=typescriptBraces
  \ start=/{/ end=/}/
  \ contains=@typescriptTypeMember,@typescriptComments,typescriptAccessibilityModifier
  \ nextgroup=typescriptUnionOrArrayType
  \ contained skipwhite fold

syntax cluster typescriptTypeMember contains=
  \ typescriptPropertySignature,
  \ @typescriptCallSignature,
  \ typescriptConstructSignature,
  \ typescriptIndexSignature,
  \ typescriptMembers,
  \ typescripEndColons
  " \ typescriptMethodSignature,

syntax region typescriptTupleType matchgroup=typescriptBraces
  \ start=/\[/ end=/\]/
  \ contains=@typescriptType
  \ contained skipwhite oneline

syntax match typescriptUnionOrArrayType /\[\]\||\|&/
  \ nextgroup=@typescriptCompoundType
  \ contains=typescriptUnion
  \ contained skipwhite

syntax match typescriptUnion /|\|&/ containedin=typescriptUnionOrArrayType

syntax cluster typescriptFunctionType contains=typescriptGenericFunc,typescriptFuncType
syntax region typescriptGenericFunc matchgroup=typescriptTypeBrackets
  \ start=/</ end=/>/ skip=/\s*,\s*/
  \ contains=typescriptTypeParameter
  \ nextgroup=typescriptFuncType
  \ containedin=typescriptFunctionType
  \ contained skipwhite skipnl

syntax region typescriptFuncType matchgroup=typescriptParens
  \ start=/(/ end=/)\ze\s*=>/
  \ contains=@typescriptParameterList
  \ nextgroup=typescriptFuncTypeArrow
  \ contained skipwhite skipnl oneline

syntax match typescriptFuncTypeArrow /=>/
  \ nextgroup=@typescriptType
  \ containedin=typescriptFuncType
  \ contained skipwhite skipnl


syntax keyword typescriptConstructorType new
  \ nextgroup=@typescriptFunctionType
  \ contained skipwhite skipnl

syntax match typescriptUserDefinedType /[a-zA-Z_$]\w*\s\+is\s\+.*\ze\($\|{\)/
  \ contained
  \ contains=@typescriptType,typescriptUserDefinedKeyword

syntax keyword typescriptUserDefinedKeyword is contained

syntax keyword typescriptTypeQuery typeof keyof
  \ nextgroup=typescriptTypeReference
  \ contained skipwhite skipnl

syntax region typescriptPropertySignature
  \ start=/[A-Za-z_$'"]\|\d/ end=/\k\@!/
  \ contains=typescriptString,typescriptOptionalMark
  \ nextgroup=typescriptTypeAnnotation
  \ containedin=typescriptTypeMember
  \ contained skipwhite oneline

syntax match typescriptMethodSignature /\v[A-Za-z_$]\w*\??\_s*\ze(\<|\()/
  \ nextgroup=@typescriptCallSignature
  \ containedin=typescriptTypeMember
  \ contained skipwhite oneline

syntax cluster typescriptCallSignature contains=typescriptGenericCall,typescriptCall
syntax region typescriptGenericCall matchgroup=typescriptTypeBrackets
  \ start=/</ end=/>/ skip=/\s*,\s*/
  \ contains=typescriptTypeParameter
  \ nextgroup=typescriptCall
  \ contained skipwhite skipnl
syntax region typescriptCall matchgroup=typescriptParens
  \ start=/(/ end=/)/
  \ contains=typescriptDecorator,@typescriptParameterList,@typescriptComments
  \ nextgroup=typescriptTypeAnnotation
  \ contained skipwhite skipnl

syntax match typescriptTypeAnnotation /?\?:/
  \ nextgroup=typescriptUserDefinedType,@typescriptType
  \ contained skipwhite skipnl

syntax cluster typescriptParameterList contains=
  \ typescriptFuncComma,
  \ typescriptTypeAnnotation,
  \ typescriptAccessibilityModifier,
  \ typescriptOptionalMark,
  \ typescriptRestOrSpread,
  \ typescriptDefaultParam

syntax keyword typescriptAccessibilityModifier public private protected readonly contained

syntax match typescriptDefaultParam /=/
  \ nextgroup=@typescriptValue
  \ contained skipwhite

syntax keyword typescriptConstructSignature new
  \ nextgroup=@typescriptCallSignature
  \ contained skipwhite

syntax region typescriptIndexSignature matchgroup=typescriptBraces
  \ start=/\[/ end=/\]/
  \ contains=typescriptTypeAnnotation,typescriptMappedIn,typescriptString
  \ nextgroup=typescriptTypeAnnotation
  \ contained skipwhite oneline

syntax keyword typescriptMappedIn in
  \ nextgroup=@typescriptType
  \ contained skipwhite skipnl skipempty

syntax keyword typescriptAliasKeyword type
  \ nextgroup=typescriptAliasDeclaration
  \ skipwhite skipnl skipempty

syntax region typescriptAliasDeclaration
  \ start=/ / end=/=/
  \ nextgroup=@typescriptType
  \ contains=typescriptConstraint
  \ contained skipwhite skipnl skipempty

