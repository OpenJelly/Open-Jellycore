//
//  aShellMini_Jelly_Enum.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum aShellMini_Jelly_Enum: String, JellyEnum, Codable {
	case `default`
	case close
	case open

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .`default`:
			return "default"
		case .close:
			return "close"
		case .open:
			return "open"

        }
    }
}

extension aShellMini_Jelly_Enum {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
