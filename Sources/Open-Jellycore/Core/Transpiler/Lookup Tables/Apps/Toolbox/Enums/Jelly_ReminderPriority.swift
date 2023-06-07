//
//  Jelly_ReminderPriority.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_ReminderPriority: String, JellyEnum, Codable {
	case None
	case Low
	case Medium
	case High

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .None:
			return "None"
		case .Low:
			return "Low"
		case .Medium:
			return "Medium"
		case .High:
			return "High"

        }
    }
}

extension Jelly_ReminderPriority {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
