//
//  Jelly_SortAlbums.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_SortAlbums: String, JellyEnum, Codable {
	case Title
	case Count

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .Title:
			return "Title"
		case .Count:
			return "Count"

        }
    }
}

extension Jelly_SortAlbums {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
