//
//  Jelly_PassTransitType.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_PassTransitType: String, JellyEnum, Codable {
	case air
	case boat
	case bus
	case generic
	case train

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .air:
			return "air"
		case .boat:
			return "boat"
		case .bus:
			return "bus"
		case .generic:
			return "generic"
		case .train:
			return "train"

        }
    }
}

extension Jelly_PassTransitType {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
