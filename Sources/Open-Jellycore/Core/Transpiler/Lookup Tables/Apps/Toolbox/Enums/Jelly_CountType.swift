//
//  Jelly_CountType.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_CountType: String, JellyEnum, Codable {
	case number
	case items

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .number:
			return "number"
		case .items:
			return "items"

        }
    }
}

extension Jelly_CountType {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
