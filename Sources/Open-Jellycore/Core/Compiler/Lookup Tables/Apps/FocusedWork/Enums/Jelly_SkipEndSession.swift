//
//  Jelly_SkipEndSession.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_SkipEndSession: String, JellyEnum, Codable {
	case no
	case endSession
	case markComplete

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .no:
			return "no"
		case .endSession:
			return "endSession"
		case .markComplete:
			return "markComplete"

        }
    }
}

extension Jelly_SkipEndSession {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
