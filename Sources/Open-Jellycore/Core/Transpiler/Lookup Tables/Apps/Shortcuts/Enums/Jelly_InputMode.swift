//
//  Jelly_InputMode.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_InputMode: String, JellyEnum, Codable {
	case asarguments
	case tostdin

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .asarguments:
			return "as arguments"
		case .tostdin:
			return "to stdin"

        }
    }
}

extension Jelly_InputMode {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
