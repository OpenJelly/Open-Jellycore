//
//  Jelly_WFStatisticsOperation.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_WFStatisticsOperation: String, JellyEnum, Codable {
	case Average
	case Minimum
	case Maximum
	case Sum
	case Median
	case Mode
	case Range
	case StandardDeviation


    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }
    
    var value: String {
        switch self {
		case .Average:
			return "Average"
		case .Minimum:
			return "Minimum"
		case .Maximum:
			return "Maximum"
		case .Sum:
			return "Sum"
		case .Median:
			return "Median"
		case .Mode:
			return "Mode"
		case .Range:
			return "Range"
		case .StandardDeviation:
			return "Standard Deviation"

        }
    }
}

extension Jelly_WFStatisticsOperation {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
