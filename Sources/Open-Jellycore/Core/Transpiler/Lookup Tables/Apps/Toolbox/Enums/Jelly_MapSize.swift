//
//  Jelly_MapSize.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_MapSize: String, JellyEnum, Codable {
	case Short
	case Medium
	case Tall

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .Short:
			return "Short"
		case .Medium:
			return "Medium"
		case .Tall:
			return "Tall"

        }
    }
}

extension Jelly_MapSize {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
