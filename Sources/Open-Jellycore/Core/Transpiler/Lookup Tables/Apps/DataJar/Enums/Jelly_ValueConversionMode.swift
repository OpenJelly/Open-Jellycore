//
//  Jelly_ValueConversionMode.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_ValueConversionMode: String, JellyEnum, Codable {
	case automatic
	case text
	case file

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .automatic:
			return "automatic"
		case .text:
			return "text"
		case .file:
			return "file"

        }
    }
}

extension Jelly_ValueConversionMode {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
