//
//  Jelly_UserDetailsType.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_UserDetailsType: String, JellyEnum, Codable {
	case username
	case name
	case givenName
	case familyName
	case initials
	case shell
	case languageCode
	case idleTime

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .username:
			return "username"
		case .name:
			return "name"
		case .givenName:
			return "givenName"
		case .familyName:
			return "familyName"
		case .initials:
			return "initials"
		case .shell:
			return "shell"
		case .languageCode:
			return "languageCode"
		case .idleTime:
			return "idleTime"

        }
    }
}

extension Jelly_UserDetailsType {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
