//
//  Jelly_IconMaskType.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_IconMaskType: String, JellyEnum, Codable {
	case square
	case circular
	case roundedRect

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .square:
			return "square"
		case .circular:
			return "circular"
		case .roundedRect:
			return "roundedRect"

        }
    }
}

extension Jelly_IconMaskType {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
