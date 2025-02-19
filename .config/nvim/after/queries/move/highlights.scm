;; Highlights file for Move

;; Types
(type_parameters) @type
(type_parameter) @type
(type_parameter_identifier) @type
(apply_type)  @type
(ref_type)  @type.ref
(primitive_type) @type.builtin

;; Comments
(line_comment) @comment
(block_comment) @comment

;; Annotations
(annotation) @annotation
(annotation_item) @annotation.item

;; Constants
(constant name: (constant_identifier)  @constant.name)
(constant expr: (num_literal)  @constant.value)
((identifier) @constant.name
 (#match? @constant.name "^[A-Z][A-Z\\d_]+$'"))

;; Function definitions
(function_definition name: (function_identifier)  @function)
(macro_function_definition name: (function_identifier)  @macro)
(native_function_definition name: (function_identifier)  @function)
(usual_spec_function name: (function_identifier)  @function)
(function_parameter name: (variable_identifier)  @variable.parameter)

;; Module definitions
(module_identity address: (module_identifier)  @namespace.module.address)
(module_identity module: (module_identifier)  @namespace.module.name)
(use_module_members address: (module_identifier)  @namespace.module.address)

;; Function calls
(call_expression (name_expression access: (module_access module: (module_identifier)  @namespace.module.name)))
(call_expression (name_expression access: (module_access member: (identifier)  @function.call)))


(label (identifier)  @label)

;; Macro calls
(macro_call_expression access: (macro_module_access) @macro.call)

;; Literals
(num_literal) @number
(address_literal) @number
(byte_string_literal) @string
(hex_string_literal) @string
(bool_literal) @boolean
(global_literal) @variable @constant
(friend_param) @module
(package_param) @module

(struct_identifier) @struct @variable @type
(function_identifier) @function
(variable_identifier) @variable
(type_parameter_identifier) @type
(primitive_type) @type
(field_identifier) @property
(constant_identifier) @property.static.constant

(use_member
  module: (identifier)? @namespace.module.name
  member: (identifier)? @variable.member @type
  alias: (identifier)? @variable.member)
(use_fun
  (module_access
    member: (identifier) @function)
  alias: (module_access
    member: (identifier) @type)
  alias: (function_identifier) @function)
(spec_let
  name: (identifier) @property)
(spec_property
  (identifier) @property)
(spec_variable
  name: (identifier) @variable)
(apply_type
  (module_access
    (identifier) @type))
(apply_type
  (module_access
    (identifier) @type.defaultLibrary
    (#match? @type.defaultLibrary "^u8|u16|u32|u64|u128|bool|address|signer|vector$")))
(call_expression
  (name_expression
    access: (module_access
      (identifier) @function)))
(macro_call_expression
  (macro_module_access) @function.macro)
(pack_expression
  (name_expression
    access: (module_access
    (identifier) @struct @type)))
(bind_unpack
  (name_expression
    access: (module_access
    (identifier) @struct @type)))
(dot_expression
  access: (name_expression) @property)
;; Uses
(use_member member: (identifier)  @include.member)
(use_module alias: (module_identifier) @namespace.module.name)

(dot_expression
  access: (index_expression
    expr: (name_expression) @property))

(quantifier_binding
  (identifier) @parameter)
(function_identifier) @function.name

;; Friends
; (friend_access local_module: (identifier)  @namespace.module.name)

;; Structs
(struct_definition name: (struct_identifier)  @type.definition.struct)
(ability) @type.ability
(field_annotation field: (field_identifier)  @field.identifier)
(field_identifier) @field.identifier

;; Enums
(enum_definition name: (enum_identifier)  @type.definition.struct)
(variant variant_name: (variant_identifier)  @constructor.name)

;; Packs
(pack_expression (name_expression access: (module_access)  @constructor.name))

;; Unpacks
;; TODO: go into variants
(bind_unpack (name_expression)  @type.name)
(module_access "$" (identifier)  @macro.variable)
"$"  @macro.variable

;; Lambdas
; (lambda_binding bind: (bind_var (variable_identifier)  @variable.parameter))
; (lambda_bindings (bind_var (variable_identifier)  @variable.parameter))


(function_parameters
  (function_parameter
    name: (variable_identifier) @parameter.modification
    type: (ref_type
      (mut_ref))))
(function_parameters
  (function_parameter
    name: (variable_identifier) @parameter.readonly
    type: (ref_type
      (imm_ref))))

(binary_expression
  operator: (binary_operator) @operator)
(unary_op) @operator


(spec_apply_name_pattern) @struct

(annotation_item
  (annotation_list
    name: (identifier) @function.macro))

(annotation
  (annotation_item
    (annotation_expr
      name: (identifier) @function.macro)))
;; Spec keywords
; "opaque" @keyword
; "aborts_if" @keyword
; "abstract" @keyword
[
 "pragma"
] @keyword

(line_comment) @comment
(
  (line_comment) @comment.documentation
  (#match? @comment.documentation "^\\\/\\\/\\\/([^/].*)?$")
)
(block_comment) @comment
(
  (block_comment) @comment.documentation
  (#match? @comment.documentation "^\\\/\\\*\\\*(\\n|[^*].*)")
)

(condition_kind) @macro
(invariant_modifier) @modifier

"&" @punctuation.special
"#" @punctuation.special
"(" @punctuation.bracket
")" @punctuation.bracket
"[" @punctuation.bracket
"]" @punctuation.bracket
"{" @punctuation.bracket
"}" @punctuation.bracket

(type_arguments
  "<" @punctuation.bracket
  ">" @punctuation.bracket)

(type_parameters
  "<" @punctuation.bracket
  ">" @punctuation.bracket)

"::" @punctuation.delimiter
":" @punctuation.delimiter
"." @punctuation.delimiter
"," @punctuation.delimiter
";" @punctuation.delimiter

[
  "const"
  "as"
  "address"
  "use"
  "entry"
  "friend"
  "has"
  "module"
  "native"
  "struct"
  "public"
  "fun"
  "spec"
  "schema"
  "include"
  "apply"
  "to"
  "with"
  "internal"
  "pragma"
  "global"
  "local"
  "copy"
  "drop"
  "key"
  "store"
  "move"
  "let"
  "if"
  "else"
  "while"
  "loop"
  "return"
  "abort"
  "break"
  "continue"
  "phantom"
  "match"
  (vector_keyword)
  (mutable_keyword)
  (macro_keyword)
  (enum_keyword)
] @keyword
