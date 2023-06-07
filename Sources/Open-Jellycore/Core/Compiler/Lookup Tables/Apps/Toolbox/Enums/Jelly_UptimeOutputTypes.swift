//
//  Jelly_UptimeOutputTypes.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_UptimeOutputTypes: String, JellyEnum, Codable {
	case seconds
	case minutes
	case hours
	case days

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .seconds:
			return "seconds"
		case .minutes:
			return "minutes"
		case .hours:
			return "hours"
		case .days:
			return "days"

        }
    }
}

extension Jelly_UptimeOutputTypes {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
