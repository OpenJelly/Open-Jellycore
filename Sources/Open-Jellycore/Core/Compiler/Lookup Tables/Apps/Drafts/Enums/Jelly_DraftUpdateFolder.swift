//
//  Jelly_DraftUpdateFolder.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_DraftUpdateFolder: String, JellyEnum, Codable {
	case inbox
	case archive
	case trash
	case noChange

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
		case .noChange:
			return "noChange"

        }
    }
}

extension Jelly_DraftUpdateFolder {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
