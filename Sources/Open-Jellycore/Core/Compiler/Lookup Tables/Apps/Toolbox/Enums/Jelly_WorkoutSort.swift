//
//  Jelly_WorkoutSort.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_WorkoutSort: String, JellyEnum, Codable {
	case StartDate
	case Duration
	case Energy
	case Distance

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .StartDate:
			return "StartDate"
		case .Duration:
			return "Duration"
		case .Energy:
			return "Energy"
		case .Distance:
			return "Distance"

        }
    }
}

extension Jelly_WorkoutSort {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
