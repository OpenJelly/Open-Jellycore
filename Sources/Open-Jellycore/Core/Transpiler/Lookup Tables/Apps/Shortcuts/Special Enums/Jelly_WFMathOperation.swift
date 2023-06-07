//
//  Jelly_WFMathOperation.swift
//  JellycoreV2
//
//  Created by Taylor Lineman on 1/2/23.
//

enum Jelly_WFMathOperation: String, JellyEnum, Codable {
    case addition
    case subtraction
    case multiplication
    case division
    case equation
    
    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }
    
    init?(parameterItem: FunctionCallParameterItem, scopedVariables: [Variable]) {
        if let itemContent = parameterItem.item?.content {
            self.init(rawValue: itemContent)
        } else {
            self.init(rawValue: parameterItem.content)
        }
    }

    var value: String {
        switch self {
        case .addition:
            return "+"
        case .subtraction:
            return "-"
        case .multiplication:
            return "×"
        case .division:
            return "÷"
        case .equation:
            return "…"
        }
    }
}


extension Jelly_WFMathOperation {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
