//
//  Jelly_EmailType.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_EmailType: String, JellyEnum, Codable {
	case home
	case work
	case other

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .home:
			return "home"
		case .work:
			return "work"
		case .other:
			return "other"

        }
    }
}

extension Jelly_EmailType {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
