//
//  Jelly_FilterDictionariesOperation.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_FilterDictionariesOperation: String, JellyEnum, Codable {
	case `is`
	case isNot
	case contains
	case doesNotContain

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .`is`:
			return "is"
		case .isNot:
			return "isNot"
		case .contains:
			return "contains"
		case .doesNotContain:
			return "doesNotContain"

        }
    }
}

extension Jelly_FilterDictionariesOperation {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
