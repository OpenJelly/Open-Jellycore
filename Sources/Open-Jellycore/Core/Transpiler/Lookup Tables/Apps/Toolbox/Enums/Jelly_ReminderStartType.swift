//
//  Jelly_ReminderStartType.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_ReminderStartType: String, JellyEnum, Codable {
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

extension Jelly_ReminderStartType {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
