//
//  Jelly_UniversalVariablesListPosition.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_UniversalVariablesListPosition: String, JellyEnum, Codable {
	case start
	case end
	case index

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .start:
			return "start"
		case .end:
			return "end"
		case .index:
			return "index"

        }
    }
}

extension Jelly_UniversalVariablesListPosition {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
