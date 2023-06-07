//
//  Jelly_PhoneType.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_PhoneType: String, JellyEnum, Codable {
	case mobile
	case work
	case home
	case other

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .mobile:
			return "mobile"
		case .work:
			return "work"
		case .home:
			return "home"
		case .other:
			return "other"

        }
    }
}

extension Jelly_PhoneType {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
