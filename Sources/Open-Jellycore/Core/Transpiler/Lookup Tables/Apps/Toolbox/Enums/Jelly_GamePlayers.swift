//
//  Jelly_GamePlayers.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_GamePlayers: String, JellyEnum, Codable {
	case all
	case singlePlayer
	case multiPlayer
	case coop
	case localCoop

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .all:
			return "all"
		case .singlePlayer:
			return "singlePlayer"
		case .multiPlayer:
			return "multiPlayer"
		case .coop:
			return "coop"
		case .localCoop:
			return "localCoop"

        }
    }
}

extension Jelly_GamePlayers {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
