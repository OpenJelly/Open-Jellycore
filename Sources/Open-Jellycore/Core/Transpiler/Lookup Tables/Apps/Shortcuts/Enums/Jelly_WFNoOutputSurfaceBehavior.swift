//
//  Jelly_WFNoOutputSurfaceBehavior.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_WFNoOutputSurfaceBehavior: String, JellyEnum, Codable {
	case Respond
	case DoNothing
	case CopyToClipboard


    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }
    
    var value: String {
        switch self {
		case .Respond:
			return "Respond"
		case .DoNothing:
			return "Do Nothing"
		case .CopyToClipboard:
			return "Copy To Clipboard"

        }
    }
}

extension Jelly_WFNoOutputSurfaceBehavior {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
