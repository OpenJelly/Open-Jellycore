//
//  Jelly_FilterCondition.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_FilterCondition: String, JellyEnum, Codable {
	case contains
	case beginsWith
	case endsWith
	case regex

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .contains:
			return "contains"
		case .beginsWith:
			return "beginsWith"
		case .endsWith:
			return "endsWith"
		case .regex:
			return "regex"

        }
    }
}

extension Jelly_FilterCondition {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
