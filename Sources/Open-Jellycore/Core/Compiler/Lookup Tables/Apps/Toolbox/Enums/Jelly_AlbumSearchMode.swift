//
//  Jelly_AlbumSearchMode.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_AlbumSearchMode: String, JellyEnum, Codable {
	case byName
	case byIdentifiers

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .byName:
			return "byName"
		case .byIdentifiers:
			return "byIdentifiers"

        }
    }
}

extension Jelly_AlbumSearchMode {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
