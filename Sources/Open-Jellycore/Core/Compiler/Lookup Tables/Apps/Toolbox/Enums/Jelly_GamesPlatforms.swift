//
//  Jelly_GamesPlatforms.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_GamesPlatforms: String, JellyEnum, Codable {
	case Playstationfour
	case xboxOne
	case pc
	case fruitCompany
	case iOS
	case PlaystationVR
	case Linux
	case NintendoSwitch
	case all

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .Playstationfour:
			return "Playstation4"
		case .xboxOne:
			return "xboxOne"
		case .pc:
			return "pc"
		case .fruitCompany:
			return "fruitCompany"
		case .iOS:
			return "iOS"
		case .PlaystationVR:
			return "PlaystationVR"
		case .Linux:
			return "Linux"
		case .NintendoSwitch:
			return "NintendoSwitch"
		case .all:
			return "all"

        }
    }
}

extension Jelly_GamesPlatforms {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
