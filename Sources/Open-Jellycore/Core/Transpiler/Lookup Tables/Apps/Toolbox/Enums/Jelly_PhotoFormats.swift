//
//  Jelly_PhotoFormats.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_PhotoFormats: String, JellyEnum, Codable {
	case jpeg
	case png

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .jpeg:
			return "jpeg"
		case .png:
			return "png"

        }
    }
}

extension Jelly_PhotoFormats {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
