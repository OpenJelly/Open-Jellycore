//
//  Jelly_TextType.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_TextType: String, JellyEnum, Codable {
	case newText
	case editText

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .newText:
			return "newText"
		case .editText:
			return "editText"

        }
    }
}

extension Jelly_TextType {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
