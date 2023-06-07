//
//  Jelly_SwitchMatchType.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_SwitchMatchType: String, JellyEnum, Codable {
	case caseContains
	case equals
	case inputContains

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .caseContains:
			return "caseContains"
		case .equals:
			return "equals"
		case .inputContains:
			return "inputContains"

        }
    }
}

extension Jelly_SwitchMatchType {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
