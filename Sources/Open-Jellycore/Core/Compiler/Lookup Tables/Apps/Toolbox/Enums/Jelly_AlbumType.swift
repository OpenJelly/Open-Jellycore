//
//  Jelly_AlbumType.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_AlbumType: String, JellyEnum, Codable {
	case User
	case System

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .User:
			return "User"
		case .System:
			return "System"

        }
    }
}

extension Jelly_AlbumType {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
