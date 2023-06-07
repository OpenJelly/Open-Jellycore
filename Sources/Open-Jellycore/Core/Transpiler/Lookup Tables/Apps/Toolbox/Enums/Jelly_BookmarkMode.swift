//
//  Jelly_BookmarkMode.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_BookmarkMode: String, JellyEnum, Codable {
	case Create
	case Get
	case Delete
	case DeleteAll
	case GetNames
	case GetURL

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .Create:
			return "Create"
		case .Get:
			return "Get"
		case .Delete:
			return "Delete"
		case .DeleteAll:
			return "DeleteAll"
		case .GetNames:
			return "GetNames"
		case .GetURL:
			return "GetURL"

        }
    }
}

extension Jelly_BookmarkMode {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
