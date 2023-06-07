//
//  Jelly_MatteColours.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_MatteColours: String, JellyEnum, Codable {
	case black
	case white
	case red
	case blue
	case green
	case yellow
	case customHex

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .black:
			return "black"
		case .white:
			return "white"
		case .red:
			return "red"
		case .blue:
			return "blue"
		case .green:
			return "green"
		case .yellow:
			return "yellow"
		case .customHex:
			return "customHex"

        }
    }
}

extension Jelly_MatteColours {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
