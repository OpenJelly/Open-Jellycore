//
//  Jelly_ContactGroupMode.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_ContactGroupMode: String, JellyEnum, Codable {
	case Add
	case Remove
	case Get

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .Add:
			return "Add"
		case .Remove:
			return "Remove"
		case .Get:
			return "Get"

        }
    }
}

extension Jelly_ContactGroupMode {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
