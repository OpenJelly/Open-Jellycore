//
//  Jelly_DraftQueryFlaggedStatus.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_DraftQueryFlaggedStatus: String, JellyEnum, Codable {
	case flagged
	case unflagged
	case any

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .flagged:
			return "flagged"
		case .unflagged:
			return "unflagged"
		case .any:
			return "any"

        }
    }
}

extension Jelly_DraftQueryFlaggedStatus {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
