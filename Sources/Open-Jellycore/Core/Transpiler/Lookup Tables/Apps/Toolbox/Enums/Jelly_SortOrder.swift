//
//  Jelly_SortOrder.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_SortOrder: String, JellyEnum, Codable {
	case az
	case za

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .az:
			return "az"
		case .za:
			return "za"

        }
    }
}

extension Jelly_SortOrder {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
