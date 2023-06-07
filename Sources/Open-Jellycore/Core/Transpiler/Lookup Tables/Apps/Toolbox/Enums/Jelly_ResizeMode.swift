//
//  Jelly_ResizeMode.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_ResizeMode: String, JellyEnum, Codable {
	case SetLongestEdge
	case SetShortestEdge

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .SetLongestEdge:
			return "SetLongestEdge"
		case .SetShortestEdge:
			return "SetShortestEdge"

        }
    }
}

extension Jelly_ResizeMode {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
