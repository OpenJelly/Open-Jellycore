//
//  Jelly_LanguageTypes.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_LanguageTypes: String, JellyEnum, Codable {
	case DeviceLocale
	case PreferredLanguages

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .DeviceLocale:
			return "DeviceLocale"
		case .PreferredLanguages:
			return "PreferredLanguages"

        }
    }
}

extension Jelly_LanguageTypes {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
