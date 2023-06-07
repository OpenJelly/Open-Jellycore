//
//  Jelly_WorkoutTimeOrder.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_WorkoutTimeOrder: String, JellyEnum, Codable {
	case OldestFirst
	case LatestFirst

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .OldestFirst:
			return "OldestFirst"
		case .LatestFirst:
			return "LatestFirst"

        }
    }
}

extension Jelly_WorkoutTimeOrder {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
