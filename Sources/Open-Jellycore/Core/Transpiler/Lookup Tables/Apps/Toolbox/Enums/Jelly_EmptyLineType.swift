//
//  Jelly_EmptyLineType.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_EmptyLineType: String, JellyEnum, Codable {
	case beforeAndAfter
	case all

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .beforeAndAfter:
			return "beforeAndAfter"
		case .all:
			return "all"

        }
    }
}

extension Jelly_EmptyLineType {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
