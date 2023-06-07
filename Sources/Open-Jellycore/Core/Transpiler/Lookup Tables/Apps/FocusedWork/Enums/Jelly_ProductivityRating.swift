//
//  Jelly_ProductivityRating.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_ProductivityRating: String, JellyEnum, Codable {
	case one
	case two
	case three
	case four
	case five

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .one:
			return "one"
		case .two:
			return "two"
		case .three:
			return "three"
		case .four:
			return "four"
		case .five:
			return "five"

        }
    }
}

extension Jelly_ProductivityRating {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
