//
//  Jelly_ShortcutLinkSortCriteria.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_ShortcutLinkSortCriteria: String, JellyEnum, Codable {
	case title
	case addedAt

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .title:
			return "title"
		case .addedAt:
			return "addedAt"

        }
    }
}

extension Jelly_ShortcutLinkSortCriteria {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
