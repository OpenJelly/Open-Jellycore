//
//  Jelly_WFTimeUntilUnit.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_WFTimeUntilUnit: String, JellyEnum, Codable {
	case TotalTime
	case Seconds
	case Minutes
	case Hours
	case Days
	case Weeks
	case Months
	case Years

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .TotalTime:
			return "Total Time"
		case .Seconds:
			return "Seconds"
		case .Minutes:
			return "Minutes"
		case .Hours:
			return "Hours"
		case .Days:
			return "Days"
		case .Weeks:
			return "Weeks"
		case .Months:
			return "Months"
		case .Years:
			return "Years"

        }
    }
}

extension Jelly_WFTimeUntilUnit {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
