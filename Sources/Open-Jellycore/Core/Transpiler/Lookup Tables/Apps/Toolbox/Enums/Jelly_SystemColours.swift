//
//  Jelly_SystemColours.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_SystemColours: String, JellyEnum, Codable {
	case Blue
	case Gray
	case Green
	case Indigo
	case Orange
	case Pink
	case Purple
	case Red
	case Teal
	case Yellow
	case Black
	case White

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .Blue:
			return "Blue"
		case .Gray:
			return "Gray"
		case .Green:
			return "Green"
		case .Indigo:
			return "Indigo"
		case .Orange:
			return "Orange"
		case .Pink:
			return "Pink"
		case .Purple:
			return "Purple"
		case .Red:
			return "Red"
		case .Teal:
			return "Teal"
		case .Yellow:
			return "Yellow"
		case .Black:
			return "Black"
		case .White:
			return "White"

        }
    }
}

extension Jelly_SystemColours {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
