//
//  Jelly_OutputType.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_OutputType: String, JellyEnum, Codable {
	case heatmap
	case cropped

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .heatmap:
			return "heatmap"
		case .cropped:
			return "cropped"

        }
    }
}

extension Jelly_OutputType {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
