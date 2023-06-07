//
//  Jelly_ThumbnailType.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_ThumbnailType: String, JellyEnum, Codable {
	case Previews
	case Icons
	case None

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .Previews:
			return "Previews"
		case .Icons:
			return "Icons"
		case .None:
			return "None"

        }
    }
}

extension Jelly_ThumbnailType {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
