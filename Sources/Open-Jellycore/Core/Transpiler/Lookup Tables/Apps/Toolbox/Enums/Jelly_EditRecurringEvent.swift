//
//  Jelly_EditRecurringEvent.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_EditRecurringEvent: String, JellyEnum, Codable {
	case SingleEvent
	case AllFutureEvents

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .SingleEvent:
			return "SingleEvent"
		case .AllFutureEvents:
			return "AllFutureEvents"

        }
    }
}

extension Jelly_EditRecurringEvent {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
