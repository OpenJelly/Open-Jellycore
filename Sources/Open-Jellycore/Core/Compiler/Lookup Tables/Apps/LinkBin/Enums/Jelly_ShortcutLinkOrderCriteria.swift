//
//  Jelly_ShortcutLinkOrderCriteria.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_ShortcutLinkOrderCriteria: String, JellyEnum, Codable {
	case ascending
	case descending

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .ascending:
			return "ascending"
		case .descending:
			return "descending"

        }
    }
}

extension Jelly_ShortcutLinkOrderCriteria {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
