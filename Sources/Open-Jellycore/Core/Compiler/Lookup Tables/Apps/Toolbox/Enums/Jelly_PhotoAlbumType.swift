//
//  Jelly_PhotoAlbumType.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_PhotoAlbumType: String, JellyEnum, Codable {
	case Album
	case Folder

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .Album:
			return "Album"
		case .Folder:
			return "Folder"

        }
    }
}

extension Jelly_PhotoAlbumType {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
