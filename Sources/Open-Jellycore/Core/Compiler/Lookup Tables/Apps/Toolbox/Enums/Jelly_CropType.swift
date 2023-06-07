//
//  Jelly_CropType.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_CropType: String, JellyEnum, Codable {
	case interest
	case objects

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .interest:
			return "interest"
		case .objects:
			return "objects"

        }
    }
}

extension Jelly_CropType {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
