//
//  Jelly_MapType.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_MapType: String, JellyEnum, Codable {
	case standard
	case satellite
	case hybrid
	case mutedStandard

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .standard:
			return "standard"
		case .satellite:
			return "satellite"
		case .hybrid:
			return "hybrid"
		case .mutedStandard:
			return "mutedStandard"

        }
    }
}

extension Jelly_MapType {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
