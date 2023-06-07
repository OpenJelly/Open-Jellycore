//
//  Jelly_RepeatType.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_RepeatType: String, JellyEnum, Codable {
	case Never
	case Daily
	case Weekly
	case Monthly
	case Yearly

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .Never:
			return "Never"
		case .Daily:
			return "Daily"
		case .Weekly:
			return "Weekly"
		case .Monthly:
			return "Monthly"
		case .Yearly:
			return "Yearly"

        }
    }
}

extension Jelly_RepeatType {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
