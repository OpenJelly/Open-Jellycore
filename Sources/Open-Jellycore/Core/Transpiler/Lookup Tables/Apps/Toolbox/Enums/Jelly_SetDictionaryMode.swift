//
//  Jelly_SetDictionaryMode.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_SetDictionaryMode: String, JellyEnum, Codable {
	case Set
	case Append

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .Set:
			return "Set"
		case .Append:
			return "Append"

        }
    }
}

extension Jelly_SetDictionaryMode {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
