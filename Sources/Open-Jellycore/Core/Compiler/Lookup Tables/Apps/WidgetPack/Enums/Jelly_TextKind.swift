//
//  Jelly_TextKind.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_TextKind: String, JellyEnum, Codable {
	case verbatim
	case date

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .verbatim:
			return "verbatim"
		case .date:
			return "date"

        }
    }
}

extension Jelly_TextKind {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
