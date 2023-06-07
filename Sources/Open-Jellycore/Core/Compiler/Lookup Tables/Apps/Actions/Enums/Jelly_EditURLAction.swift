//
//  Jelly_EditURLAction.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_EditURLAction: String, JellyEnum, Codable {
	case addQueryItem
	case addPathComponent
	case appendToQuery
	case appendToFragment
	case removeQueryItemsNamed
	case removeLastPathComponent
	case removeQuery
	case removeFragment
	case removePath
	case removePort
	case removeUserAndPassword
	case setQuery
	case setFragment
	case setPath
	case setScheme
	case setHost
	case setUsernameAndPassword

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .addQueryItem:
			return "addQueryItem"
		case .addPathComponent:
			return "addPathComponent"
		case .appendToQuery:
			return "appendToQuery"
		case .appendToFragment:
			return "appendToFragment"
		case .removeQueryItemsNamed:
			return "removeQueryItemsNamed"
		case .removeLastPathComponent:
			return "removeLastPathComponent"
		case .removeQuery:
			return "removeQuery"
		case .removeFragment:
			return "removeFragment"
		case .removePath:
			return "removePath"
		case .removePort:
			return "removePort"
		case .removeUserAndPassword:
			return "removeUserAndPassword"
		case .setQuery:
			return "setQuery"
		case .setFragment:
			return "setFragment"
		case .setPath:
			return "setPath"
		case .setScheme:
			return "setScheme"
		case .setHost:
			return "setHost"
		case .setUsernameAndPassword:
			return "setUsernameAndPassword"

        }
    }
}

extension Jelly_EditURLAction {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
