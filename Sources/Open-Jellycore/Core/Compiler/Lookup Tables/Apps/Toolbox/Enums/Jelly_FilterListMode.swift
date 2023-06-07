//
//  Jelly_FilterListMode.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_FilterListMode: String, JellyEnum, Codable {
	case starting
	case ending
	case cofntaining

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .starting:
			return "starting"
		case .ending:
			return "ending"
		case .cofntaining:
			return "cofntaining"

        }
    }
}

extension Jelly_FilterListMode {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
