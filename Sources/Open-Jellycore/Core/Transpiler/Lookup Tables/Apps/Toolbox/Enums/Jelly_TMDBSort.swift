//
//  Jelly_TMDBSort.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_TMDBSort: String, JellyEnum, Codable {
	case Title
	case ReleaseYear
	case Revenue
	case VoteAverage
	case VoteCount
	case Popularity

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .Title:
			return "Title"
		case .ReleaseYear:
			return "ReleaseYear"
		case .Revenue:
			return "Revenue"
		case .VoteAverage:
			return "VoteAverage"
		case .VoteCount:
			return "VoteCount"
		case .Popularity:
			return "Popularity"

        }
    }
}

extension Jelly_TMDBSort {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
