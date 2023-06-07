//
//  Jelly_GamesGenres.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_GamesGenres: String, JellyEnum, Codable {
	case adventure
	case arcade
	case fighting
	case indie
	case music
	case platform
	case pointAndClick
	case puzzle
	case quiz
	case racing
	case rts
	case rpg
	case shooter
	case simulator
	case sport
	case strategy
	case tactical
	case tbs
	case all

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .adventure:
			return "adventure"
		case .arcade:
			return "arcade"
		case .fighting:
			return "fighting"
		case .indie:
			return "indie"
		case .music:
			return "music"
		case .platform:
			return "platform"
		case .pointAndClick:
			return "pointAndClick"
		case .puzzle:
			return "puzzle"
		case .quiz:
			return "quiz"
		case .racing:
			return "racing"
		case .rts:
			return "rts"
		case .rpg:
			return "rpg"
		case .shooter:
			return "shooter"
		case .simulator:
			return "simulator"
		case .sport:
			return "sport"
		case .strategy:
			return "strategy"
		case .tactical:
			return "tactical"
		case .tbs:
			return "tbs"
		case .all:
			return "all"

        }
    }
}

extension Jelly_GamesGenres {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
