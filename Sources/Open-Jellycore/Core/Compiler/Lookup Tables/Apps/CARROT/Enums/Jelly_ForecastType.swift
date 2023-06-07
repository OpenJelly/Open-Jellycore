//
//  Jelly_ForecastType.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_ForecastType: String, JellyEnum, Codable {
	case current
	case hourly
	case daily

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .current:
			return "current"
		case .hourly:
			return "hourly"
		case .daily:
			return "daily"

        }
    }
}

extension Jelly_ForecastType {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
