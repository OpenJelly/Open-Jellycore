//
//  Jelly_HTMLSource.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_HTMLSource: String, JellyEnum, Codable {
	case rawHTML
	case imgSrc
	case text
	case links

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .rawHTML:
			return "rawHTML"
		case .imgSrc:
			return "imgSrc"
		case .text:
			return "text"
		case .links:
			return "links"

        }
    }
}

extension Jelly_HTMLSource {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
