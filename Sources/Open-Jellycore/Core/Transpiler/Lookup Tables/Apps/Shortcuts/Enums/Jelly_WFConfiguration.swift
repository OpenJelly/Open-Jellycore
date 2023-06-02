//
//  Jelly_WFConfiguration.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_WFConfiguration: String, JellyEnum, Codable {
	case FitScreen
	case TopHalf
	case BottomHalf
	case LeftHalf
	case RightHalf
	case TopLeftQuarter
	case TopRightQuarter
	case BottomLeftQuarter
	case BottomRightQuarter
	case Dimensions


    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }
    
    var value: String {
        switch self {
		case .FitScreen:
			return "Fit Screen"
		case .TopHalf:
			return "Top Half"
		case .BottomHalf:
			return "Bottom Half"
		case .LeftHalf:
			return "Left Half"
		case .RightHalf:
			return "Right Half"
		case .TopLeftQuarter:
			return "Top Left Quarter"
		case .TopRightQuarter:
			return "Top Right Quarter"
		case .BottomLeftQuarter:
			return "Bottom Left Quarter"
		case .BottomRightQuarter:
			return "Bottom Right Quarter"
		case .Dimensions:
			return "Dimensions"

        }
    }
}

extension Jelly_WFConfiguration {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
