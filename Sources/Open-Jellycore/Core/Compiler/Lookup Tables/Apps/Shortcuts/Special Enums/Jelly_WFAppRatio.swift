//
//  Jelly_WFAppRatio.swift
//  JellycoreV2
//
//  Created by Taylor Lineman on 1/2/23.
//

enum Jelly_WFAppRatio: String, JellyEnum, Codable {
    case half
    case thirds
    
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
        case .half:
            return "½ + ½"
        case .thirds:
            return "⅓ + ⅔"
        }
    }
}

extension Jelly_WFAppRatio {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
