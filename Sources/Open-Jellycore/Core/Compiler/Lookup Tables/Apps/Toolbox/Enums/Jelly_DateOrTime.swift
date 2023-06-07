//
//  Jelly_DateOrTime.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_DateOrTime: String, JellyEnum, Codable {
	case DateFormat
	case TimeFormat
	case ZoneFormat

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .DateFormat:
			return "DateFormat"
		case .TimeFormat:
			return "TimeFormat"
		case .ZoneFormat:
			return "ZoneFormat"

        }
    }
}

extension Jelly_DateOrTime {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
