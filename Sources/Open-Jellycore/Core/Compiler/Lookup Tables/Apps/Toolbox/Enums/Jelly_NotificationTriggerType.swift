//
//  Jelly_NotificationTriggerType.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_NotificationTriggerType: String, JellyEnum, Codable {
	case Now
	case AtTime
	case AtLocation
	case InMinutes
	case InHours

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .Now:
			return "Now"
		case .AtTime:
			return "AtTime"
		case .AtLocation:
			return "AtLocation"
		case .InMinutes:
			return "InMinutes"
		case .InHours:
			return "InHours"

        }
    }
}

extension Jelly_NotificationTriggerType {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
