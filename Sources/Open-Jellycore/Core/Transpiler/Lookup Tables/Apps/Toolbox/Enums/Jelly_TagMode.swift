//
//  Jelly_TagMode.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_TagMode: String, JellyEnum, Codable {
	case set
	case removeAll
	case get
	case add
	case remove

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .set:
			return "set"
		case .removeAll:
			return "removeAll"
		case .get:
			return "get"
		case .add:
			return "add"
		case .remove:
			return "remove"

        }
    }
}

extension Jelly_TagMode {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
