//
//  Jelly_StorageTypes.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_StorageTypes: String, JellyEnum, Codable {
	case totalCapacity
	case remainingSpace
	case usedSpace

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .totalCapacity:
			return "totalCapacity"
		case .remainingSpace:
			return "remainingSpace"
		case .usedSpace:
			return "usedSpace"

        }
    }
}

extension Jelly_StorageTypes {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
