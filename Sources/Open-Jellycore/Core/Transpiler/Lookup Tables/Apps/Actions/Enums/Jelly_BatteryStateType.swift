//
//  Jelly_BatteryStateType.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_BatteryStateType: String, JellyEnum, Codable {
	case unplugged
	case charging
	case full

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .unplugged:
			return "unplugged"
		case .charging:
			return "charging"
		case .full:
			return "full"

        }
    }
}

extension Jelly_BatteryStateType {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
