//
//  Jelly_WFItemSpecifier.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_WFItemSpecifier: String, JellyEnum, Codable {
	case FirstItem
	case LastItem
	case RandomItem
	case ItemAtIndex
	case ItemsInRange

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .FirstItem:
			return "First Item"
		case .LastItem:
			return "Last Item"
		case .RandomItem:
			return "Random Item"
		case .ItemAtIndex:
			return "Item At Index"
		case .ItemsInRange:
			return "Items In Range"

        }
    }
}

extension Jelly_WFItemSpecifier {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
