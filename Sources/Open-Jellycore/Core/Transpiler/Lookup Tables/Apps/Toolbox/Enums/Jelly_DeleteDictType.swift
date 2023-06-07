//
//  Jelly_DeleteDictType.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_DeleteDictType: String, JellyEnum, Codable {
	case deleteKey
	case keyPairWithKeyContaining
	case keyPairWithValueContaining
	case mergeDictionaries

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .deleteKey:
			return "deleteKey"
		case .keyPairWithKeyContaining:
			return "keyPairWithKeyContaining"
		case .keyPairWithValueContaining:
			return "keyPairWithValueContaining"
		case .mergeDictionaries:
			return "mergeDictionaries"

        }
    }
}

extension Jelly_DeleteDictType {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
