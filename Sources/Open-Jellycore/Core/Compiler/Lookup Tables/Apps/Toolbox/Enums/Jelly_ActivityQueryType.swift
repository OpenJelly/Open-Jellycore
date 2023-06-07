//
//  Jelly_ActivityQueryType.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_ActivityQueryType: String, JellyEnum, Codable {
	case Today
	case BetweenDates
	case OnDay

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .Today:
			return "Today"
		case .BetweenDates:
			return "BetweenDates"
		case .OnDay:
			return "OnDay"

        }
    }
}

extension Jelly_ActivityQueryType {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
