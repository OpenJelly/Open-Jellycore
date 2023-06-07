//
//  Jelly_DraftWriteType.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_DraftWriteType: String, JellyEnum, Codable {
	case replace
	case prepend
	case append

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .replace:
			return "replace"
		case .prepend:
			return "prepend"
		case .append:
			return "append"

        }
    }
}

extension Jelly_DraftWriteType {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
