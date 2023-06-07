//
//  Jelly_SongRatingMode.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_SongRatingMode: String, JellyEnum, Codable {
	case set
	case get

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .set:
			return "set"
		case .get:
			return "get"

        }
    }
}

extension Jelly_SongRatingMode {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
