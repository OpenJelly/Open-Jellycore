//
//  Jelly_ShowHideStatus.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_ShowHideStatus: String, JellyEnum, Codable {
	case show
	case hide
	case noChange

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .show:
			return "show"
		case .hide:
			return "hide"
		case .noChange:
			return "noChange"

        }
    }
}

extension Jelly_ShowHideStatus {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
