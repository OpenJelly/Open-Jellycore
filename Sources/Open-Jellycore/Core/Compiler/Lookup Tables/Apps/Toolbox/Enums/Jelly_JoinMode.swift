//
//  Jelly_JoinMode.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_JoinMode: String, JellyEnum, Codable {
	case Append
	case Prepend

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .Append:
			return "Append"
		case .Prepend:
			return "Prepend"

        }
    }
}

extension Jelly_JoinMode {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
