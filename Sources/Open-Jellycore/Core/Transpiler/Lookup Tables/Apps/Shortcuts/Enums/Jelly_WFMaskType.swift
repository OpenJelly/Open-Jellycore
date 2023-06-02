//
//  Jelly_WFMaskType.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_WFMaskType: String, JellyEnum, Codable {
	case RoundedRectangle
	case Ellipse
	case Icon
	case CustomImage


    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }
    
    var value: String {
        switch self {
		case .RoundedRectangle:
			return "Rounded Rectangle"
		case .Ellipse:
			return "Ellipse"
		case .Icon:
			return "Icon"
		case .CustomImage:
			return "Custom Image"

        }
    }
}

extension Jelly_WFMaskType {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
