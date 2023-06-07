//
//  Jelly_ReminderDueType.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_ReminderDueType: String, JellyEnum, Codable {
	case AllDay
	case DateAndTime
	case noDate

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .AllDay:
			return "AllDay"
		case .DateAndTime:
			return "DateAndTime"
		case .noDate:
			return "noDate"

        }
    }
}

extension Jelly_ReminderDueType {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
