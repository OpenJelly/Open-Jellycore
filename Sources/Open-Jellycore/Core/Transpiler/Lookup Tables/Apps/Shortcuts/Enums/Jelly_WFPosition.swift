//
//  Jelly_WFPosition.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_WFPosition: String, JellyEnum, Codable {
	case TopLeft
	case topCenter
	case TopRight
	case MiddleLeft
	case Center
	case MiddleRight
	case BottomLeft
	case BottomCenter
	case BottomRight
	case Coordinates


    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }
    
    var value: String {
        switch self {
		case .TopLeft:
			return "Top Left"
		case .topCenter:
			return "top Center"
		case .TopRight:
			return "Top Right"
		case .MiddleLeft:
			return "Middle Left"
		case .Center:
			return "Center"
		case .MiddleRight:
			return "Middle Right"
		case .BottomLeft:
			return "Bottom Left"
		case .BottomCenter:
			return "Bottom Center"
		case .BottomRight:
			return "Bottom Right"
		case .Coordinates:
			return "Coordinates"

        }
    }
}

extension Jelly_WFPosition {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
