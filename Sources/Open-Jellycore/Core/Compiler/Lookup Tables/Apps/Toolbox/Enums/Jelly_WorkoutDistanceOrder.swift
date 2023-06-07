//
//  Jelly_WorkoutDistanceOrder.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_WorkoutDistanceOrder: String, JellyEnum, Codable {
	case FurthestFirst
	case ShortestFirst

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .FurthestFirst:
			return "FurthestFirst"
		case .ShortestFirst:
			return "ShortestFirst"

        }
    }
}

extension Jelly_WorkoutDistanceOrder {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
