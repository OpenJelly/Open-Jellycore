//
//  Jelly_WFLabelColorNumber.swift
//  JellycoreV2
//
//  Created by Taylor Lineman on 1/2/23.
//

enum Jelly_WFLabelColorNumber: String, JellyEnum, Codable {
    case NoColor
    case Red
    case Orange
    case Yellow
    case Green
    case Blue
    case Purple
    case Gray
    
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
        case .NoColor:
            return "0"
        case .Red:
            return "6"
        case .Orange:
            return "7"
        case .Yellow:
            return "5"
        case .Green:
            return "2"
        case .Blue:
            return "4"
        case .Purple:
            return "3"
        case .Gray:
            return "1"
        }
    }
}

extension Jelly_WFLabelColorNumber {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(Int(value))
    }
}
