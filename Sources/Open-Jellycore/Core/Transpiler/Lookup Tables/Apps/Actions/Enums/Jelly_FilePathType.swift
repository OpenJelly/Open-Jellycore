//
//  Jelly_FilePathType.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_FilePathType: String, JellyEnum, Codable {
	case path
	case url
	case tildePath

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .path:
			return "path"
		case .url:
			return "url"
		case .tildePath:
			return "tildePath"

        }
    }
}

extension Jelly_FilePathType {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
