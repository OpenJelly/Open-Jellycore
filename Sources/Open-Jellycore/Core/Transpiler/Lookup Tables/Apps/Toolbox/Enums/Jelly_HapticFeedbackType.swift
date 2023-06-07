//
//  Jelly_HapticFeedbackType.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_HapticFeedbackType: String, JellyEnum, Codable {
	case error
	case success
	case warning
	case light
	case medium
	case heavy
	case selection

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .error:
			return "error"
		case .success:
			return "success"
		case .warning:
			return "warning"
		case .light:
			return "light"
		case .medium:
			return "medium"
		case .heavy:
			return "heavy"
		case .selection:
			return "selection"

        }
    }
}

extension Jelly_HapticFeedbackType {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
