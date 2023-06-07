//
//  Jelly_BMSearchMode.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_BMSearchMode: String, JellyEnum, Codable {
	case containing
	case excluding
	case starting
	case ending

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .containing:
			return "containing"
		case .excluding:
			return "excluding"
		case .starting:
			return "starting"
		case .ending:
			return "ending"

        }
    }
}

extension Jelly_BMSearchMode {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
