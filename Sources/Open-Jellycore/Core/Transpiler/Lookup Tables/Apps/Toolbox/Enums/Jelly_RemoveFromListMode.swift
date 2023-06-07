//
//  Jelly_RemoveFromListMode.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_RemoveFromListMode: String, JellyEnum, Codable {
	case itemsAtPositions
	case itemsInRange
	case firstItem
	case lastItem

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .itemsAtPositions:
			return "itemsAtPositions"
		case .itemsInRange:
			return "itemsInRange"
		case .firstItem:
			return "firstItem"
		case .lastItem:
			return "lastItem"

        }
    }
}

extension Jelly_RemoveFromListMode {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
