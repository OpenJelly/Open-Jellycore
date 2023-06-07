//
//  Jelly_DateContext.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_DateContext: String, JellyEnum, Codable {
	case StartOfSentence
	case Dynamic
	case ListItem
	case MiddleOfSentence
	case Standalone

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .StartOfSentence:
			return "StartOfSentence"
		case .Dynamic:
			return "Dynamic"
		case .ListItem:
			return "ListItem"
		case .MiddleOfSentence:
			return "MiddleOfSentence"
		case .Standalone:
			return "Standalone"

        }
    }
}

extension Jelly_DateContext {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
