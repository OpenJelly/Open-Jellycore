//
//  Jelly_DictionaryOrCSV.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_DictionaryOrCSV: String, JellyEnum, Codable {
	case dictionary
	case CSV

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .dictionary:
			return "dictionary"
		case .CSV:
			return "CSV"

        }
    }
}

extension Jelly_DictionaryOrCSV {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
