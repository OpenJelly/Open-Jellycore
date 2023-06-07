//
//  Jelly_UserInterfaceStyle.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_UserInterfaceStyle: String, JellyEnum, Codable {
	case light
	case dark

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .light:
			return "light"
		case .dark:
			return "dark"

        }
    }
}

extension Jelly_UserInterfaceStyle {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
