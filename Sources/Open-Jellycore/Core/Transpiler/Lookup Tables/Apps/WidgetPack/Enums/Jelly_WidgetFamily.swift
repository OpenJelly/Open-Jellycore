//
//  Jelly_WidgetFamily.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_WidgetFamily: String, JellyEnum, Codable {
	case small
	case medium
	case large

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .small:
			return "small"
		case .medium:
			return "medium"
		case .large:
			return "large"

        }
    }
}

extension Jelly_WidgetFamily {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
