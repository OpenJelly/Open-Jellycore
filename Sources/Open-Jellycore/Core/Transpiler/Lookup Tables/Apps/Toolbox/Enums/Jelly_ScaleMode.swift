//
//  Jelly_ScaleMode.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_ScaleMode: String, JellyEnum, Codable {
	case longestEdge
	case shortestEdge

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .longestEdge:
			return "longestEdge"
		case .shortestEdge:
			return "shortestEdge"

        }
    }
}

extension Jelly_ScaleMode {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
