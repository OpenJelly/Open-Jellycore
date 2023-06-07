//
//  Jelly_PhotoSize.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_PhotoSize: String, JellyEnum, Codable {
	case thumbnail
	case small
	case regular
	case full
	case custom

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .thumbnail:
			return "thumbnail"
		case .small:
			return "small"
		case .regular:
			return "regular"
		case .full:
			return "full"
		case .custom:
			return "custom"

        }
    }
}

extension Jelly_PhotoSize {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
