//
//  Jelly_ThumbsOutputType.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_ThumbsOutputType: String, JellyEnum, Codable {
	case Images
	case Basesixtyfour

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .Images:
			return "Images"
		case .Basesixtyfour:
			return "Base64"

        }
    }
}

extension Jelly_ThumbsOutputType {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
