//
//  Jelly_WFAdjustOperation.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_WFAdjustOperation: String, JellyEnum, Codable {
	case Add
	case Subtract
	case GetStartofMinute
	case GetStartofHour
	case GetStartofDay
	case GetStartofWeek
	case GetStartofMonth
	case GetStartofYear


    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }
    
    var value: String {
        switch self {
		case .Add:
			return "Add"
		case .Subtract:
			return "Subtract"
		case .GetStartofMinute:
			return "Get Start of Minute"
		case .GetStartofHour:
			return "Get Start of Hour"
		case .GetStartofDay:
			return "Get Start of Day"
		case .GetStartofWeek:
			return "Get Start of Week"
		case .GetStartofMonth:
			return "Get Start of Month"
		case .GetStartofYear:
			return "Get Start of Year"

        }
    }
}

extension Jelly_WFAdjustOperation {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
