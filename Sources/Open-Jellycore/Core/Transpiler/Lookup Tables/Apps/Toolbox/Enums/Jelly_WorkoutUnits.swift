//
//  Jelly_WorkoutUnits.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_WorkoutUnits: String, JellyEnum, Codable {
	case imperial
	case metric

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .imperial:
			return "imperial"
		case .metric:
			return "metric"

        }
    }
}

extension Jelly_WorkoutUnits {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
