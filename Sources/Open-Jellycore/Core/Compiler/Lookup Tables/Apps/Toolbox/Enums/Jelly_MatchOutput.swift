//
//  Jelly_MatchOutput.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_MatchOutput: String, JellyEnum, Codable {
	case AllMatches
	case FirstMatch
	case LastMatch

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .AllMatches:
			return "AllMatches"
		case .FirstMatch:
			return "FirstMatch"
		case .LastMatch:
			return "LastMatch"

        }
    }
}

extension Jelly_MatchOutput {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
