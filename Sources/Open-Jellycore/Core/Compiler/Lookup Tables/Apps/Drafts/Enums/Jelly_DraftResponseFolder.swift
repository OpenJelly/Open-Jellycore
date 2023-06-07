//
//  Jelly_DraftResponseFolder.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_DraftResponseFolder: String, JellyEnum, Codable {
	case inbox
	case archive
	case trash
	case all

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .inbox:
			return "inbox"
		case .archive:
			return "archive"
		case .trash:
			return "trash"
		case .all:
			return "all"

        }
    }
}

extension Jelly_DraftResponseFolder {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
