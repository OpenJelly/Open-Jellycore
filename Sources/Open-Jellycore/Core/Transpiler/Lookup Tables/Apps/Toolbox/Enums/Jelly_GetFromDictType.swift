//
//  Jelly_GetFromDictType.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_GetFromDictType: String, JellyEnum, Codable {
	case GetValuesOfKeysContaining
	case GetValuesOfKeyThatDontContain

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .GetValuesOfKeysContaining:
			return "GetValuesOfKeysContaining"
		case .GetValuesOfKeyThatDontContain:
			return "GetValuesOfKeyThatDontContain"

        }
    }
}

extension Jelly_GetFromDictType {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
