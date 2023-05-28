//
//  ParserNodeType.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 5/21/23.
//

import Foundation

/// These are analogous to the nodes defined in `grammar.js` in the `tree-sitter-jelly` package. They are used to pull parsed nodes directly from the tree sitter tree. Any new nodes added in `grammar.js` need to be added here
enum CoreNodeType: String {
    case flag = "flag"
    case `import` = "import"
    case `repeat` = "repeat_definition"
    case repeatEach = "repeat_each_definition"
    case conditional = "conditional_definition"
    case conditionalElse = "conditional_else"
    case `operator` = "operator"
    case menu = "menu_definition"
    case menuParameters = "menu_parameters"
    case menuBlock = "menu_block"
    case menuCase = "menu_case"
    case function = "function_definition"
    case macro = "macro_definition"
    case parameterList = "parameter_list"
    case parameterListItem = "parameter_list_item"
    case statement = "statement"
    case variableDeclaration = "variable_declaration"
    case setVariable = "set_variable"
    case functionCall = "function_call"
    case magicVariable = "magic_variable_definition"
    case returnStatement = "return_statement"
    case identifier = "identifier"
    case number = "number"
    case array = "array"
    case string = "string"
    case multiString = "multi_line_string"
    case stringInterpolation = "string_interpolation"
    case block = "block"
    case comment = "comment"
    case blockComment = "block_comment"
    case variableProperty = "variable_property"
    case variablePropertyType = "variable_property_type"
}
