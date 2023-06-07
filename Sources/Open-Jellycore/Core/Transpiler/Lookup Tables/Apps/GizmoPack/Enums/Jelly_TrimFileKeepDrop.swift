//
//  Jelly_TrimFileKeepDrop.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_TrimFileKeepDrop: String, JellyEnum, Codable {
	case keep
	case drop

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .keep:
			return "keep"
		case .drop:
			return "drop"

        }
    }
}

extension Jelly_TrimFileKeepDrop {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
