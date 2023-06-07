//
//  Jelly_MusicType.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_MusicType: String, JellyEnum, Codable {
	case album
	case song

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .album:
			return "album"
		case .song:
			return "song"

        }
    }
}

extension Jelly_MusicType {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
