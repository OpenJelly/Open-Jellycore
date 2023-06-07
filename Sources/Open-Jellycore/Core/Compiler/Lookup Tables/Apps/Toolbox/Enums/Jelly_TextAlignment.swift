//
//  Jelly_TextAlignment.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_TextAlignment: String, JellyEnum, Codable {
	case centre
	case justified
	case left
	case right

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .centre:
			return "centre"
		case .justified:
			return "justified"
		case .left:
			return "left"
		case .right:
			return "right"

        }
    }
}

extension Jelly_TextAlignment {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
