//
//  Jelly_RawgSortOrder.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_RawgSortOrder: String, JellyEnum, Codable {
	case name
	case dateReleased
	case rating
	case metacriticScore
	case popularity

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .name:
			return "name"
		case .dateReleased:
			return "dateReleased"
		case .rating:
			return "rating"
		case .metacriticScore:
			return "metacriticScore"
		case .popularity:
			return "popularity"

        }
    }
}

extension Jelly_RawgSortOrder {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
