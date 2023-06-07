//
//  Jelly_TextInputType.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_TextInputType: String, JellyEnum, Codable {
	case PlainText
	case RichText

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .PlainText:
			return "PlainText"
		case .RichText:
			return "RichText"

        }
    }
}

extension Jelly_TextInputType {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
