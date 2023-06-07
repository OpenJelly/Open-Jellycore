//
//  Jelly_PexelPhotoColours.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_PexelPhotoColours: String, JellyEnum, Codable {
	case all
	case black
	case blue
	case brown
	case gray
	case green
	case orange
	case pink
	case red
	case turquoise
	case violet
	case white
	case yellow
	case custom

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .all:
			return "all"
		case .black:
			return "black"
		case .blue:
			return "blue"
		case .brown:
			return "brown"
		case .gray:
			return "gray"
		case .green:
			return "green"
		case .orange:
			return "orange"
		case .pink:
			return "pink"
		case .red:
			return "red"
		case .turquoise:
			return "turquoise"
		case .violet:
			return "violet"
		case .white:
			return "white"
		case .yellow:
			return "yellow"
		case .custom:
			return "custom"

        }
    }
}

extension Jelly_PexelPhotoColours {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
