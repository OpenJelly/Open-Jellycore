//
//  Jelly_ColorKind.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_ColorKind: String, JellyEnum, Codable {
	case accentColor
	case black
	case blue
	case clear
	case gray
	case green
	case orange
	case pink
	case primary
	case purple
	case red
	case secondary
	case white
	case yellow
	case custom
	case fromHex

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .accentColor:
			return "accentColor"
		case .black:
			return "black"
		case .blue:
			return "blue"
		case .clear:
			return "clear"
		case .gray:
			return "gray"
		case .green:
			return "green"
		case .orange:
			return "orange"
		case .pink:
			return "pink"
		case .primary:
			return "primary"
		case .purple:
			return "purple"
		case .red:
			return "red"
		case .secondary:
			return "secondary"
		case .white:
			return "white"
		case .yellow:
			return "yellow"
		case .custom:
			return "custom"
		case .fromHex:
			return "fromHex"

        }
    }
}

extension Jelly_ColorKind {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
