//
//  Jelly_WidgetInteractAction.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_WidgetInteractAction: String, JellyEnum, Codable {
	case openApp
	case runScript
	case openScript
	case openURL

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .openApp:
			return "openApp"
		case .runScript:
			return "runScript"
		case .openScript:
			return "openScript"
		case .openURL:
			return "openURL"

        }
    }
}

extension Jelly_WidgetInteractAction {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
