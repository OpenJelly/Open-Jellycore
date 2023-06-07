//
//  Jelly_PassType.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_PassType: String, JellyEnum, Codable {
	case boardingPass
	case coupon
	case eventTicket
	case generic
	case storeCard

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .boardingPass:
			return "boardingPass"
		case .coupon:
			return "coupon"
		case .eventTicket:
			return "eventTicket"
		case .generic:
			return "generic"
		case .storeCard:
			return "storeCard"

        }
    }
}

extension Jelly_PassType {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
