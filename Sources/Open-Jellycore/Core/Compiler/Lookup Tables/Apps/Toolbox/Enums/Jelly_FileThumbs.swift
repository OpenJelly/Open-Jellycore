//
//  Jelly_FileThumbs.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_FileThumbs: String, JellyEnum, Codable {
	case none
	case icons
	case previews

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .none:
			return "none"
		case .icons:
			return "icons"
		case .previews:
			return "previews"

        }
    }
}

extension Jelly_FileThumbs {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
