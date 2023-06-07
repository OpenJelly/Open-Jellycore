//
//  Jelly_RecentMusicType.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_RecentMusicType: String, JellyEnum, Codable {
	case recentlyPlayed
	case recentlyAdded
	case heavyRotation

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .recentlyPlayed:
			return "recentlyPlayed"
		case .recentlyAdded:
			return "recentlyAdded"
		case .heavyRotation:
			return "heavyRotation"

        }
    }
}

extension Jelly_RecentMusicType {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
