//
//  Jelly_BackgroundColours.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_BackgroundColours: String, JellyEnum, Codable {
	case clear
	case blue
	case green
	case red
	case pink
	case yellow
	case teal
	case orange
	case indigo
	case black
	case white
	case customHex

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .clear:
			return "clear"
		case .blue:
			return "blue"
		case .green:
			return "green"
		case .red:
			return "red"
		case .pink:
			return "pink"
		case .yellow:
			return "yellow"
		case .teal:
			return "teal"
		case .orange:
			return "orange"
		case .indigo:
			return "indigo"
		case .black:
			return "black"
		case .white:
			return "white"
		case .customHex:
			return "customHex"

        }
    }
}

extension Jelly_BackgroundColours {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
