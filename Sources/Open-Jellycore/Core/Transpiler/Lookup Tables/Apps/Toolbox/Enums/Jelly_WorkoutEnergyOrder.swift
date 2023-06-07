//
//  Jelly_WorkoutEnergyOrder.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_WorkoutEnergyOrder: String, JellyEnum, Codable {
	case MostEnergyFirst
	case LeastEnergyFirst

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .MostEnergyFirst:
			return "MostEnergyFirst"
		case .LeastEnergyFirst:
			return "LeastEnergyFirst"

        }
    }
}

extension Jelly_WorkoutEnergyOrder {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
