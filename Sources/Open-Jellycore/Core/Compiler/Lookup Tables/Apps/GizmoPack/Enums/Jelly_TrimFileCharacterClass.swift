//
//  Jelly_TrimFileCharacterClass.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_TrimFileCharacterClass: String, JellyEnum, Codable {
	case spaces
	case lines

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .spaces:
			return "spaces"
		case .lines:
			return "lines"

        }
    }
}

extension Jelly_TrimFileCharacterClass {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
