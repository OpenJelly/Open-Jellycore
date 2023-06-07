//
//  Jelly_IconCreationMode.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_IconCreationMode: String, JellyEnum, Codable {
	case basic
	case advanced
	case emojiName

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .basic:
			return "basic"
		case .advanced:
			return "advanced"
		case .emojiName:
			return "emojiName"

        }
    }
}

extension Jelly_IconCreationMode {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
