//
//  Jelly_TmdbTvSort.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_TmdbTvSort: String, JellyEnum, Codable {
	case firstAired
	case voteAverage
	case popularity

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .firstAired:
			return "firstAired"
		case .voteAverage:
			return "voteAverage"
		case .popularity:
			return "popularity"

        }
    }
}

extension Jelly_TmdbTvSort {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
