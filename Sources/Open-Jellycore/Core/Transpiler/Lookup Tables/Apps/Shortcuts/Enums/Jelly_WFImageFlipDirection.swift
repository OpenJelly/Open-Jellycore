//
//  Jelly_WFImageFlipDirection.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_WFImageFlipDirection: String, JellyEnum, Codable {
	case Vertical
	case Horizontal

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .Vertical:
			return "Vertical"
		case .Horizontal:
			return "Horizontal"

        }
    }
}

extension Jelly_WFImageFlipDirection {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
