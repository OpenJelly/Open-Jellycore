//
//  Jelly_PreviewButtonStyle.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_PreviewButtonStyle: String, JellyEnum, Codable {
	case textOnly
	case outlineSquare
	case outlineRounded
	case filledSquare
	case filledRounded

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .textOnly:
			return "textOnly"
		case .outlineSquare:
			return "outlineSquare"
		case .outlineRounded:
			return "outlineRounded"
		case .filledSquare:
			return "filledSquare"
		case .filledRounded:
			return "filledRounded"

        }
    }
}

extension Jelly_PreviewButtonStyle {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
