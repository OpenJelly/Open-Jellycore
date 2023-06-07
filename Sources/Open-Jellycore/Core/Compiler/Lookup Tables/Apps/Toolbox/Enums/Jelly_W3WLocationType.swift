//
//  Jelly_W3WLocationType.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_W3WLocationType: String, JellyEnum, Codable {
	case location
	case address
	case coordinates

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .location:
			return "location"
		case .address:
			return "address"
		case .coordinates:
			return "coordinates"

        }
    }
}

extension Jelly_W3WLocationType {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
