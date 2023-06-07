//
//  Jelly_OverwriteStrategy.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_OverwriteStrategy: String, JellyEnum, Codable {
	case alwaysAllow
	case alwaysDisallow
	case disallowArraysAndDictionaries

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .alwaysAllow:
			return "alwaysAllow"
		case .alwaysDisallow:
			return "alwaysDisallow"
		case .disallowArraysAndDictionaries:
			return "disallowArraysAndDictionaries"

        }
    }
}

extension Jelly_OverwriteStrategy {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
