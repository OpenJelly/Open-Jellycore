//
//  Jelly_GetFolderContentsMode.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_GetFolderContentsMode: String, JellyEnum, Codable {
	case fileNames
	case fileDetailsDictionary

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .fileNames:
			return "fileNames"
		case .fileDetailsDictionary:
			return "fileDetailsDictionary"

        }
    }
}

extension Jelly_GetFolderContentsMode {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
