//
//  Jelly_FontKind.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_FontKind: String, JellyEnum, Codable {
	case largeTitle
	case title
	case titletwo
	case titlethree
	case headline
	case subheadline
	case body
	case callout
	case caption
	case captiontwo
	case footnote
	case systemSizeWeightDesign

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .largeTitle:
			return "largeTitle"
		case .title:
			return "title"
		case .titletwo:
			return "title2"
		case .titlethree:
			return "title3"
		case .headline:
			return "headline"
		case .subheadline:
			return "subheadline"
		case .body:
			return "body"
		case .callout:
			return "callout"
		case .caption:
			return "caption"
		case .captiontwo:
			return "caption2"
		case .footnote:
			return "footnote"
		case .systemSizeWeightDesign:
			return "systemSizeWeightDesign"

        }
    }
}

extension Jelly_FontKind {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
