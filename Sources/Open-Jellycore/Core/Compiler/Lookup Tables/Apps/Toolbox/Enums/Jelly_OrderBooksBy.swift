//
//  Jelly_OrderBooksBy.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_OrderBooksBy: String, JellyEnum, Codable {
	case newest
	case relevance

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .newest:
			return "newest"
		case .relevance:
			return "relevance"

        }
    }
}

extension Jelly_OrderBooksBy {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
