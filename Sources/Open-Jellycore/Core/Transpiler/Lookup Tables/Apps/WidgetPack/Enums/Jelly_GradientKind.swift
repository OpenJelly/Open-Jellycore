//
//  Jelly_GradientKind.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_GradientKind: String, JellyEnum, Codable {
	case linear
	case radial
	case angular

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .linear:
			return "linear"
		case .radial:
			return "radial"
		case .angular:
			return "angular"

        }
    }
}

extension Jelly_GradientKind {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
