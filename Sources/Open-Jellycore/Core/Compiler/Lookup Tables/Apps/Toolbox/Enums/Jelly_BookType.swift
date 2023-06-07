//
//  Jelly_BookType.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_BookType: String, JellyEnum, Codable {
	case all
	case books
	case magazines

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .all:
			return "all"
		case .books:
			return "books"
		case .magazines:
			return "magazines"

        }
    }
}

extension Jelly_BookType {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
