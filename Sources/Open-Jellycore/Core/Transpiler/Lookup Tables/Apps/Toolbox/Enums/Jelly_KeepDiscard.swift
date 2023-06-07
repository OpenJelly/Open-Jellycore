//
//  Jelly_KeepDiscard.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_KeepDiscard: String, JellyEnum, Codable {
	case keep
	case discard

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .keep:
			return "keep"
		case .discard:
			return "discard"

        }
    }
}

extension Jelly_KeepDiscard {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
