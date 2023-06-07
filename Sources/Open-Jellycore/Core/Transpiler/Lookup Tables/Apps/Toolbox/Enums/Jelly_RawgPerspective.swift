//
//  Jelly_RawgPerspective.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_RawgPerspective: String, JellyEnum, Codable {
	case firstPerson
	case thirdPerson
	case none
	case pointAndClick
	case twoDimensional
	case sideScroller
	case topDown

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .firstPerson:
			return "firstPerson"
		case .thirdPerson:
			return "thirdPerson"
		case .none:
			return "none"
		case .pointAndClick:
			return "pointAndClick"
		case .twoDimensional:
			return "twoDimensional"
		case .sideScroller:
			return "sideScroller"
		case .topDown:
			return "topDown"

        }
    }
}

extension Jelly_RawgPerspective {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
