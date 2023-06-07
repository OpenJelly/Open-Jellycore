//
//  Jelly_SongRating.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_SongRating: String, JellyEnum, Codable {
	case none
	case love
	case dislike

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .none:
			return "none"
		case .love:
			return "love"
		case .dislike:
			return "dislike"

        }
    }
}

extension Jelly_SongRating {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
