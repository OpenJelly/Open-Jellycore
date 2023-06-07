//
//  Jelly_SongSearchMode.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_SongSearchMode: String, JellyEnum, Codable {
	case byName
	case byIdentifiers
	case byISRC

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .byName:
			return "byName"
		case .byIdentifiers:
			return "byIdentifiers"
		case .byISRC:
			return "byISRC"

        }
    }
}

extension Jelly_SongSearchMode {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
