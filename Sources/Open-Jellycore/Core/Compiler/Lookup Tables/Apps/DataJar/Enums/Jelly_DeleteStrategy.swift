//
//  Jelly_DeleteStrategy.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_DeleteStrategy: String, JellyEnum, Codable {
	case alwaysAllow
	case disallowArraysAndDictionaries

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .alwaysAllow:
			return "alwaysAllow"
		case .disallowArraysAndDictionaries:
			return "disallowArraysAndDictionaries"

        }
    }
}

extension Jelly_DeleteStrategy {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
