//
//  Jelly_RegexMatchType.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_RegexMatchType: String, JellyEnum, Codable {
	case TextAfter
	case TextBefore
	case TextBetween

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .TextAfter:
			return "TextAfter"
		case .TextBefore:
			return "TextBefore"
		case .TextBetween:
			return "TextBetween"

        }
    }
}

extension Jelly_RegexMatchType {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
