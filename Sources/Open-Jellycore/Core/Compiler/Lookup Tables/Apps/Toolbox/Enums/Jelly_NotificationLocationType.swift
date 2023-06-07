//
//  Jelly_NotificationLocationType.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_NotificationLocationType: String, JellyEnum, Codable {
	case Arriving
	case Leaving
	case Both

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .Arriving:
			return "Arriving"
		case .Leaving:
			return "Leaving"
		case .Both:
			return "Both"

        }
    }
}

extension Jelly_NotificationLocationType {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
