//
//  Jelly_TrimFrom.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_TrimFrom: String, JellyEnum, Codable {
	case TrimFromStart
	case TrimFromEnd

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .TrimFromStart:
			return "TrimFromStart"
		case .TrimFromEnd:
			return "TrimFromEnd"

        }
    }
}

extension Jelly_TrimFrom {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
