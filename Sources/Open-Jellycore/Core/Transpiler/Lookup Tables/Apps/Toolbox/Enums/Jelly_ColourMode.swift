//
//  Jelly_ColourMode.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_ColourMode: String, JellyEnum, Codable {
	case single
	case allAsDictionary

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .single:
			return "single"
		case .allAsDictionary:
			return "allAsDictionary"

        }
    }
}

extension Jelly_ColourMode {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
