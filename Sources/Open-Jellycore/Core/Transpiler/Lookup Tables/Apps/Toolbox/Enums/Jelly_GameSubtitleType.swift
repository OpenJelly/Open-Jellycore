//
//  Jelly_GameSubtitleType.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_GameSubtitleType: String, JellyEnum, Codable {
	case platforms
	case genres
	case parentPlatforms
	case ratings
	case metacriticScore

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .platforms:
			return "platforms"
		case .genres:
			return "genres"
		case .parentPlatforms:
			return "parentPlatforms"
		case .ratings:
			return "ratings"
		case .metacriticScore:
			return "metacriticScore"

        }
    }
}

extension Jelly_GameSubtitleType {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
