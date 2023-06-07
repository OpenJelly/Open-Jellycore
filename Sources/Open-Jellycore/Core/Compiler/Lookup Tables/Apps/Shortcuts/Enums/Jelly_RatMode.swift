//
//  Jelly_RatMode.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_RatMode: String, JellyEnum, Codable {
	case fourG
	case LTE
	case threeG
	case fiveG

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .fourG:
			return "4G"
		case .LTE:
			return "LTE"
		case .threeG:
			return "3G"
		case .fiveG:
			return "5G"

        }
    }
}

extension Jelly_RatMode {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
