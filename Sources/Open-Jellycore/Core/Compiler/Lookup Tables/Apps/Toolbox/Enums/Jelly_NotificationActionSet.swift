//
//  Jelly_NotificationActionSet.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_NotificationActionSet: String, JellyEnum, Codable {
	case none
	case ok
	case yesNo
	case acceptDecline
	case open
	case inputText

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .none:
			return "none"
		case .ok:
			return "ok"
		case .yesNo:
			return "yesNo"
		case .acceptDecline:
			return "acceptDecline"
		case .open:
			return "open"
		case .inputText:
			return "inputText"

        }
    }
}

extension Jelly_NotificationActionSet {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
