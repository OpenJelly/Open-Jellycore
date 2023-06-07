//
//  Jelly_JSONQueryType.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_JSONQueryType: String, JellyEnum, Codable {
	case jsonPath
	case jq

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .jsonPath:
			return "jsonPath"
		case .jq:
			return "jq"

        }
    }
}

extension Jelly_JSONQueryType {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
