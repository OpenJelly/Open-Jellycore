//
//  Jelly_BatteryStates.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_BatteryStates: String, JellyEnum, Codable {
	case isCharging
	case lowPowerModeOn

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .isCharging:
			return "isCharging"
		case .lowPowerModeOn:
			return "lowPowerModeOn"

        }
    }
}

extension Jelly_BatteryStates {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
