//
//  Jelly_IconType.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_IconType: String, JellyEnum, Codable {
	case customImage
	case symbolLibrary
	case defaults
	case imageURL
	case basesixtyfour
	case emoji

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .customImage:
			return "customImage"
		case .symbolLibrary:
			return "symbolLibrary"
		case .defaults:
			return "defaults"
		case .imageURL:
			return "imageURL"
		case .basesixtyfour:
			return "base64"
		case .emoji:
			return "emoji"

        }
    }
}

extension Jelly_IconType {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
