//
//  Jelly_WFTimeFormatStyle.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_WFTimeFormatStyle: String, JellyEnum, Codable {
	case None
	case Short
	case Medium
	case Long
	case Relative

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

        }
    }
}

extension Jelly_WFTimeFormatStyle {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
