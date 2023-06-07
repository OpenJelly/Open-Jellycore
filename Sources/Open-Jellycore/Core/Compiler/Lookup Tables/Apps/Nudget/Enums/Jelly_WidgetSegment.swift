//
//  Jelly_WidgetSegment.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_WidgetSegment: String, JellyEnum, Codable {
	case day
	case week
	case month
	case quarter
	case year

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .day:
			return "day"
		case .week:
			return "week"
		case .month:
			return "month"
		case .quarter:
			return "quarter"
		case .year:
			return "year"

        }
    }
}

extension Jelly_WidgetSegment {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
