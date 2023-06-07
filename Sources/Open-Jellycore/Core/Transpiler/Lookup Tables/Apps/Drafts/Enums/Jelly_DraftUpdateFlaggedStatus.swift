//
//  Jelly_DraftUpdateFlaggedStatus.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_DraftUpdateFlaggedStatus: String, JellyEnum, Codable {
	case flagged
	case unflagged
	case noChange

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .flagged:
			return "flagged"
		case .unflagged:
			return "unflagged"
		case .noChange:
			return "noChange"

        }
    }
}

extension Jelly_DraftUpdateFlaggedStatus {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
