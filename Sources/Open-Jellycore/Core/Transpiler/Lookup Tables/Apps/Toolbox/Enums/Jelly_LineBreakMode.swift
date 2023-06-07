//
//  Jelly_LineBreakMode.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_LineBreakMode: String, JellyEnum, Codable {
	case WrapWord
	case WrapChar
	case ClipText
	case TruncateHead
	case TruncateTail
	case TruncateMiddle

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .WrapWord:
			return "WrapWord"
		case .WrapChar:
			return "WrapChar"
		case .ClipText:
			return "ClipText"
		case .TruncateHead:
			return "TruncateHead"
		case .TruncateTail:
			return "TruncateTail"
		case .TruncateMiddle:
			return "TruncateMiddle"

        }
    }
}

extension Jelly_LineBreakMode {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
