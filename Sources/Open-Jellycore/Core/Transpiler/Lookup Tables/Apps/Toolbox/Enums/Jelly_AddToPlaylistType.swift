//
//  Jelly_AddToPlaylistType.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_AddToPlaylistType: String, JellyEnum, Codable {
	case songs
	case albums
	case playlists

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .songs:
			return "songs"
		case .albums:
			return "albums"
		case .playlists:
			return "playlists"

        }
    }
}

extension Jelly_AddToPlaylistType {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
