//
//  Jelly_WorkoutDurationOrder.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_WorkoutDurationOrder: String, JellyEnum, Codable {
	case LongestFirst
	case ShortestFirst

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .LongestFirst:
			return "LongestFirst"
		case .ShortestFirst:
			return "ShortestFirst"

        }
    }
}

extension Jelly_WorkoutDurationOrder {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
