//
//  Jelly_SaliencyType.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_SaliencyType: String, JellyEnum, Codable {
	case objects
	case attention

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .objects:
			return "objects"
		case .attention:
			return "attention"

        }
    }
}

extension Jelly_SaliencyType {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
