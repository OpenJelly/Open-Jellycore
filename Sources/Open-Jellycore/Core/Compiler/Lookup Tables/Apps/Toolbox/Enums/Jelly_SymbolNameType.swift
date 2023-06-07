//
//  Jelly_SymbolNameType.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_SymbolNameType: String, JellyEnum, Codable {
	case Single
	case All

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .Single:
			return "Single"
		case .All:
			return "All"

        }
    }
}

extension Jelly_SymbolNameType {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
