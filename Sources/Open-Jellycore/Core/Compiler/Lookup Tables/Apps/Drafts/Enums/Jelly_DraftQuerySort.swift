//
//  Jelly_DraftQuerySort.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_DraftQuerySort: String, JellyEnum, Codable {
	case created
	case modified
	case accessed
	case text

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .created:
			return "created"
		case .modified:
			return "modified"
		case .accessed:
			return "accessed"
		case .text:
			return "text"

        }
    }
}

extension Jelly_DraftQuerySort {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
