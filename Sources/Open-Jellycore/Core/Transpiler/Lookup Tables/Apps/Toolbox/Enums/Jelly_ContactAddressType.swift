//
//  Jelly_ContactAddressType.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_ContactAddressType: String, JellyEnum, Codable {
	case address
	case location

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .address:
			return "address"
		case .location:
			return "location"

        }
    }
}

extension Jelly_ContactAddressType {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
