//
//  Jelly_Transformation.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_Transformation: String, JellyEnum, Codable {
	case camelCase
	case pascalCase
	case snakeCase
	case constantCase
	case dashCase

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .camelCase:
			return "camelCase"
		case .pascalCase:
			return "pascalCase"
		case .snakeCase:
			return "snakeCase"
		case .constantCase:
			return "constantCase"
		case .dashCase:
			return "dashCase"

        }
    }
}

extension Jelly_Transformation {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
