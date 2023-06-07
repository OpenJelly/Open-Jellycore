//
//  Jelly_OrderGamesBy.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_OrderGamesBy: String, JellyEnum, Codable {
	case name
	case releaseDate

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .name:
			return "name"
		case .releaseDate:
			return "releaseDate"

        }
    }
}

extension Jelly_OrderGamesBy {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
