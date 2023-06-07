//
//  Jelly_GetAllVariablesMode.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_GetAllVariablesMode: String, JellyEnum, Codable {
	case listOfNames
	case dictionaryOfValues

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .listOfNames:
			return "listOfNames"
		case .dictionaryOfValues:
			return "dictionaryOfValues"

        }
    }
}

extension Jelly_GetAllVariablesMode {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
