//
//  Jelly_EditFolderBookmarkMode.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_EditFolderBookmarkMode: String, JellyEnum, Codable {
	case Delete
	case DeleteAll
	case List
	case GetURL

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .Delete:
			return "Delete"
		case .DeleteAll:
			return "DeleteAll"
		case .List:
			return "List"
		case .GetURL:
			return "GetURL"

        }
    }
}

extension Jelly_EditFolderBookmarkMode {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
