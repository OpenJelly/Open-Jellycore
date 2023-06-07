//
//  Jelly_RemoveFromListAction.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_RemoveFromListAction: String, JellyEnum, Codable {
	case firstItem
	case lastItem
	case index
	case range

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .firstItem:
			return "firstItem"
		case .lastItem:
			return "lastItem"
		case .index:
			return "index"
		case .range:
			return "range"

        }
    }
}

extension Jelly_RemoveFromListAction {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
