//
//  Jelly_WFDateFormatStyle.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_WFDateFormatStyle: String, JellyEnum, Codable {
	case None
	case Short
	case Medium
	case Long
	case Relative
	case RFCtwothousandeighthundredtwentytwo
	case ISOeightthousandsixhundredone
	case Custom


    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }
    
    var value: String {
        switch self {
		case .None:
			return "None"
		case .Short:
			return "Short"
		case .Medium:
			return "Medium"
		case .Long:
			return "Long"
		case .Relative:
			return "Relative"
		case .RFCtwothousandeighthundredtwentytwo:
			return "RFC 2822"
		case .ISOeightthousandsixhundredone:
			return "ISO 8601"
		case .Custom:
			return "Custom"

        }
    }
}

extension Jelly_WFDateFormatStyle {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
