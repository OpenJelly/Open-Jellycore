//
//  Actions_Jelly_HapticFeedbackType.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Actions_Jelly_HapticFeedbackType: String, JellyEnum, Codable {
	case success
	case warning
	case error
	case selection
	case soft
	case light
	case medium
	case heavy
	case rigid

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .success:
			return "success"
		case .warning:
			return "warning"
		case .error:
			return "error"
		case .selection:
			return "selection"
		case .soft:
			return "soft"
		case .light:
			return "light"
		case .medium:
			return "medium"
		case .heavy:
			return "heavy"
		case .rigid:
			return "rigid"

        }
    }
}

extension Actions_Jelly_HapticFeedbackType {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
