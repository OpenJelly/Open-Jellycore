//
//  Jelly_EventAlert.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_EventAlert: String, JellyEnum, Codable {
	case None
	case AtTimeOfEvent
	case FiveMinsBefore
	case FifteenMinsBefore
	case ThirtyMinsBefore
	case OneHourBefore
	case TwoHoursBefore
	case OneDayBefore
	case TwoDaysBefore
	case OneWeekBefore
	case Custom

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .None:
			return "None"
		case .AtTimeOfEvent:
			return "AtTimeOfEvent"
		case .FiveMinsBefore:
			return "FiveMinsBefore"
		case .FifteenMinsBefore:
			return "FifteenMinsBefore"
		case .ThirtyMinsBefore:
			return "ThirtyMinsBefore"
		case .OneHourBefore:
			return "OneHourBefore"
		case .TwoHoursBefore:
			return "TwoHoursBefore"
		case .OneDayBefore:
			return "OneDayBefore"
		case .TwoDaysBefore:
			return "TwoDaysBefore"
		case .OneWeekBefore:
			return "OneWeekBefore"
		case .Custom:
			return "Custom"

        }
    }
}

extension Jelly_EventAlert {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
