//
//  Jelly_RawgQueryMatching.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_RawgQueryMatching: String, JellyEnum, Codable {
	case fuzzy
	case precise
	case exact

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .fuzzy:
			return "fuzzy"
		case .precise:
			return "precise"
		case .exact:
			return "exact"

        }
    }
}

extension Jelly_RawgQueryMatching {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
