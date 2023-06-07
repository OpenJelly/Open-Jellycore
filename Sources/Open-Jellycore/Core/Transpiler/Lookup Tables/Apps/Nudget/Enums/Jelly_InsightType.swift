//
//  Jelly_InsightType.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_InsightType: String, JellyEnum, Codable {
	case budget
	case totalSpending
	case mostSpendy
	case biggestDrop
	case biggestJump

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .budget:
			return "budget"
		case .totalSpending:
			return "totalSpending"
		case .mostSpendy:
			return "mostSpendy"
		case .biggestDrop:
			return "biggestDrop"
		case .biggestJump:
			return "biggestJump"

        }
    }
}

extension Jelly_InsightType {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
