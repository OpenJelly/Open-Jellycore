//
//  Jelly_NotificationSoundType.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_NotificationSoundType: String, JellyEnum, Codable {
	case `default`
	case custom
	case none

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .`default`:
			return "default"
		case .custom:
			return "custom"
		case .none:
			return "none"

        }
    }
}

extension Jelly_NotificationSoundType {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
