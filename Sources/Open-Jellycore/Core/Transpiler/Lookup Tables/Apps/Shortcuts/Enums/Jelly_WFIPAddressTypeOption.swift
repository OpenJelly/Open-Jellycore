//
//  Jelly_WFIPAddressTypeOption.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_WFIPAddressTypeOption: String, JellyEnum, Codable {
	case IPvfour
	case IPvsix

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .IPvfour:
			return "IPv4"
		case .IPvsix:
			return "IPv6"

        }
    }
}

extension Jelly_WFIPAddressTypeOption {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
