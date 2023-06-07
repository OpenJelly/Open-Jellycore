//
//  Jelly_PreviewThemes.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_PreviewThemes: String, JellyEnum, Codable {
	case Default
	case Midnight
	case Swiss

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .Default:
			return "Default"
		case .Midnight:
			return "Midnight"
		case .Swiss:
			return "Swiss"

        }
    }
}

extension Jelly_PreviewThemes {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
