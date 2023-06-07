//
//  Jelly_EditTextSource.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_EditTextSource: String, JellyEnum, Codable {
	case bookmarkedFile
	case bookmarkedFolder

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .bookmarkedFile:
			return "bookmarkedFile"
		case .bookmarkedFolder:
			return "bookmarkedFolder"

        }
    }
}

extension Jelly_EditTextSource {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
