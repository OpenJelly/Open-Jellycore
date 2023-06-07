//
//  Jelly_DefaultColours.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_DefaultColours: String, JellyEnum, Codable {
	case Blue
	case Brown
	case Green
	case Grey
	case Indigo
	case LightBlue
	case Orange
	case Pink
	case Purple
	case Red
	case Rose
	case Yellow

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .Blue:
			return "Blue"
		case .Brown:
			return "Brown"
		case .Green:
			return "Green"
		case .Grey:
			return "Grey"
		case .Indigo:
			return "Indigo"
		case .LightBlue:
			return "LightBlue"
		case .Orange:
			return "Orange"
		case .Pink:
			return "Pink"
		case .Purple:
			return "Purple"
		case .Red:
			return "Red"
		case .Rose:
			return "Rose"
		case .Yellow:
			return "Yellow"

        }
    }
}

extension Jelly_DefaultColours {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
