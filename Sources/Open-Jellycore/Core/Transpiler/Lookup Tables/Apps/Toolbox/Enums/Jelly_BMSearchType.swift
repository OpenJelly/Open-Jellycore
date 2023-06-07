//
//  Jelly_BMSearchType.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_BMSearchType: String, JellyEnum, Codable {
	case All
	case Query

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .All:
			return "All"
		case .Query:
			return "Query"

        }
    }
}

extension Jelly_BMSearchType {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
