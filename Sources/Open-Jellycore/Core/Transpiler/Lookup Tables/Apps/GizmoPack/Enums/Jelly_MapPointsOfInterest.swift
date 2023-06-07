//
//  Jelly_MapPointsOfInterest.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_MapPointsOfInterest: String, JellyEnum, Codable {
	case includeAll
	case excludeAll

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .includeAll:
			return "includeAll"
		case .excludeAll:
			return "excludeAll"

        }
    }
}

extension Jelly_MapPointsOfInterest {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
