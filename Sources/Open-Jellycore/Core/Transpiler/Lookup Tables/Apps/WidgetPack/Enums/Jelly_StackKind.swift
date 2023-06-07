//
//  Jelly_StackKind.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_StackKind: String, JellyEnum, Codable {
	case horizontal
	case vertical
	case z

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .horizontal:
			return "horizontal"
		case .vertical:
			return "vertical"
		case .z:
			return "z"

        }
    }
}

extension Jelly_StackKind {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
