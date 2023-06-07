//
//  Jelly_GetKeysSource.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_GetKeysSource: String, JellyEnum, Codable {
	case root
	case dictionary

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .root:
			return "root"
		case .dictionary:
			return "dictionary"

        }
    }
}

extension Jelly_GetKeysSource {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
