//
//  Jelly_RepeatMode.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_RepeatMode: String, JellyEnum, Codable {
	case off
	case one
	case all

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .off:
			return "off"
		case .one:
			return "one"
		case .all:
			return "all"

        }
    }
}

extension Jelly_RepeatMode {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
