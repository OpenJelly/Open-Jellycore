//
//  Jelly_HeatmapType.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_HeatmapType: String, JellyEnum, Codable {
	case attention
	case object

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .attention:
			return "attention"
		case .object:
			return "object"

        }
    }
}

extension Jelly_HeatmapType {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
