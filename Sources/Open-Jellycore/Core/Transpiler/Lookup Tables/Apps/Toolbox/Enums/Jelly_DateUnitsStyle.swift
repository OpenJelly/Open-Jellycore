//
//  Jelly_DateUnitsStyle.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_DateUnitsStyle: String, JellyEnum, Codable {
	case Abbreviated
	case Full

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .Abbreviated:
			return "Abbreviated"
		case .Full:
			return "Full"

        }
    }
}

extension Jelly_DateUnitsStyle {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
