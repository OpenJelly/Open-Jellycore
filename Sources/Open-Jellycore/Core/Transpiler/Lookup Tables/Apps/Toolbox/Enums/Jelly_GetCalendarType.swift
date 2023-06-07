//
//  Jelly_GetCalendarType.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_GetCalendarType: String, JellyEnum, Codable {
	case List
	case DictionaryOfDetails

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .List:
			return "List"
		case .DictionaryOfDetails:
			return "DictionaryOfDetails"

        }
    }
}

extension Jelly_GetCalendarType {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
