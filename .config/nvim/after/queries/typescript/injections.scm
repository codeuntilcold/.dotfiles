((call_expression
  function: (member_expression
    object: (identifier) @method.object
    property: (property_identifier) @method.prop)
  arguments: (arguments
    (template_string
      (string_fragment) @injection.content)))
  (#eq? @method.object "queryRunner")
  (#eq? @method.prop "query")
  (#set! injection.language "sql")
 )
