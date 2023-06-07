//
//  Jelly_ParseCSVDelimiter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_ParseCSVDelimiter: String, JellyEnum, Codable {
	case detect
	case comma
	case tab
	case custom

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .detect:
			return "detect"
		case .comma:
			return "comma"
		case .tab:
			return "tab"
		case .custom:
			return "custom"

        }
    }
}

extension Jelly_ParseCSVDelimiter {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
