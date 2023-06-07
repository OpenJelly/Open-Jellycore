//
//  Jelly_LocationAlertType.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_LocationAlertType: String, JellyEnum, Codable {
	case Arriving
	case Leaving

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .Arriving:
			return "Arriving"
		case .Leaving:
			return "Leaving"

        }
    }
}

extension Jelly_LocationAlertType {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
