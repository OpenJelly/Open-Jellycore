//
//  Jelly_AddAddressType.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_AddAddressType: String, JellyEnum, Codable {
	case none
	case location
	case address

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .none:
			return "none"
		case .location:
			return "location"
		case .address:
			return "address"

        }
    }
}

extension Jelly_AddAddressType {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
