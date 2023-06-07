//
//  Jelly_PluraliseCase.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_PluraliseCase: String, JellyEnum, Codable {
	case sentence
	case title
	case lower
	case upper

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .sentence:
			return "sentence"
		case .title:
			return "title"
		case .lower:
			return "lower"
		case .upper:
			return "upper"

        }
    }
}

extension Jelly_PluraliseCase {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
