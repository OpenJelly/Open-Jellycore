//
//  Jelly_EventAvailability.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_EventAvailability: String, JellyEnum, Codable {
	case Busy
	case Free

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .Busy:
			return "Busy"
		case .Free:
			return "Free"

        }
    }
}

extension Jelly_EventAvailability {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
