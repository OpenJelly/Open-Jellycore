//
//  Jelly_PhotoColours.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_PhotoColours: String, JellyEnum, Codable {
	case blackWhite
	case black
	case white
	case yellow
	case orange
	case red
	case purple
	case magenta
	case green
	case teal
	case blue

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .blackWhite:
			return "blackWhite"
		case .black:
			return "black"
		case .white:
			return "white"
		case .yellow:
			return "yellow"
		case .orange:
			return "orange"
		case .red:
			return "red"
		case .purple:
			return "purple"
		case .magenta:
			return "magenta"
		case .green:
			return "green"
		case .teal:
			return "teal"
		case .blue:
			return "blue"

        }
    }
}

extension Jelly_PhotoColours {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
