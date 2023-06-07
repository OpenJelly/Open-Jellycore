//
//  Jelly_ReminderListType.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_ReminderListType: String, JellyEnum, Codable {
	case ListNames
	case DetailsAsDict

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .ListNames:
			return "ListNames"
		case .DetailsAsDict:
			return "DetailsAsDict"

        }
    }
}

extension Jelly_ReminderListType {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
