//
//  Jelly_FileURLType.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_FileURLType: String, JellyEnum, Codable {
	case absolutePath
	case filesURL

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .absolutePath:
			return "absolutePath"
		case .filesURL:
			return "filesURL"

        }
    }
}

extension Jelly_FileURLType {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
