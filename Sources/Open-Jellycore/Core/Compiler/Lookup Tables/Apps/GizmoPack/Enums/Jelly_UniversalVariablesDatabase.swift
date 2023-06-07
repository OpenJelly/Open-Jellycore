//
//  Jelly_UniversalVariablesDatabase.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_UniversalVariablesDatabase: String, JellyEnum, Codable {
	case `public`
	case protected
	case `private`

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .`public`:
			return "public"
		case .protected:
			return "protected"
		case .`private`:
			return "private"

        }
    }
}

extension Jelly_UniversalVariablesDatabase {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
