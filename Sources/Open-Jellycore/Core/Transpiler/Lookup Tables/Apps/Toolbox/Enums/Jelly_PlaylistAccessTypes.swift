//
//  Jelly_PlaylistAccessTypes.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_PlaylistAccessTypes: String, JellyEnum, Codable {
	case all
	case editable
	case locked

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .all:
			return "all"
		case .editable:
			return "editable"
		case .locked:
			return "locked"

        }
    }
}

extension Jelly_PlaylistAccessTypes {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
