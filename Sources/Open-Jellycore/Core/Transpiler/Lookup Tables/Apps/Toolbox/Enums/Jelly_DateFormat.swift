//
//  Jelly_DateFormat.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_DateFormat: String, JellyEnum, Codable {
	case weekdayFull
	case weekdayMed
	case weekdayShort
	case weekdaySingle
	case dayOfWeekNumber
	case dayOfMonthNumber
	case dayOfYearNumber
	case dayOfWeekInMonth
	case weekOfMonth
	case monthNumber
	case monthShort
	case monthLong
	case monthSingle
	case yearFull
	case yearShort
	case quarterFull
	case quarterShort
	case quarterNumber

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .weekdayFull:
			return "weekdayFull"
		case .weekdayMed:
			return "weekdayMed"
		case .weekdayShort:
			return "weekdayShort"
		case .weekdaySingle:
			return "weekdaySingle"
		case .dayOfWeekNumber:
			return "dayOfWeekNumber"
		case .dayOfMonthNumber:
			return "dayOfMonthNumber"
		case .dayOfYearNumber:
			return "dayOfYearNumber"
		case .dayOfWeekInMonth:
			return "dayOfWeekInMonth"
		case .weekOfMonth:
			return "weekOfMonth"
		case .monthNumber:
			return "monthNumber"
		case .monthShort:
			return "monthShort"
		case .monthLong:
			return "monthLong"
		case .monthSingle:
			return "monthSingle"
		case .yearFull:
			return "yearFull"
		case .yearShort:
			return "yearShort"
		case .quarterFull:
			return "quarterFull"
		case .quarterShort:
			return "quarterShort"
		case .quarterNumber:
			return "quarterNumber"

        }
    }
}

extension Jelly_DateFormat {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
