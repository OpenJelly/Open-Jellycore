//
//  Jelly_EmojiCategories.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_EmojiCategories: String, JellyEnum, Codable {
	case Abstract
	case Cosmos
	case Faces
	case Food
	case Gestures
	case Nature
	case Objects
	case People
	case Places
	case Symbols
	case Tools
	case Transportation
	case All

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .Abstract:
			return "Abstract"
		case .Cosmos:
			return "Cosmos"
		case .Faces:
			return "Faces"
		case .Food:
			return "Food"
		case .Gestures:
			return "Gestures"
		case .Nature:
			return "Nature"
		case .Objects:
			return "Objects"
		case .People:
			return "People"
		case .Places:
			return "Places"
		case .Symbols:
			return "Symbols"
		case .Tools:
			return "Tools"
		case .Transportation:
			return "Transportation"
		case .All:
			return "All"

        }
    }
}

extension Jelly_EmojiCategories {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
