//
//  Jelly_Sampling.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_Sampling: String, JellyEnum, Codable {
	case temperature
	case probability

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .temperature:
			return "temperature"
		case .probability:
			return "probability"

        }
    }
}

extension Jelly_Sampling {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
