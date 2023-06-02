//
//  Jelly_WFURLComponent.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_WFURLComponent: String, JellyEnum, Codable {
	case Scheme
	case User
	case Password
	case Host
	case Port
	case Path
	case Query
	case Fragment


    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }
    
    var value: String {
        switch self {
		case .Scheme:
			return "Scheme"
		case .User:
			return "User"
		case .Password:
			return "Password"
		case .Host:
			return "Host"
		case .Port:
			return "Port"
		case .Path:
			return "Path"
		case .Query:
			return "Query"
		case .Fragment:
			return "Fragment"

        }
    }
}

extension Jelly_WFURLComponent {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
