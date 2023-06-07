//
//  Jelly_MinVidSize.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_MinVidSize: String, JellyEnum, Codable {
	case all
	case small
	case medium
	case large

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .all:
			return "all"
		case .small:
			return "small"
		case .medium:
			return "medium"
		case .large:
			return "large"

        }
    }
}

extension Jelly_MinVidSize {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
