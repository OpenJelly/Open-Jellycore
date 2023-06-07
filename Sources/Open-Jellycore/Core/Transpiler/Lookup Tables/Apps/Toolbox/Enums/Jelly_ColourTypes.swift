//
//  Jelly_ColourTypes.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_ColourTypes: String, JellyEnum, Codable {
	case averageColour
	case primaryColour
	case secondaryColour
	case backgroundColour
	case detailColour
	case AllAsDictionary

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .averageColour:
			return "averageColour"
		case .primaryColour:
			return "primaryColour"
		case .secondaryColour:
			return "secondaryColour"
		case .backgroundColour:
			return "backgroundColour"
		case .detailColour:
			return "detailColour"
		case .AllAsDictionary:
			return "AllAsDictionary"

        }
    }
}

extension Jelly_ColourTypes {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
