//
//  Jelly_UniversalVariableOperation.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_UniversalVariableOperation: String, JellyEnum, Codable {
	case set
	case get
	case add
	case delete
	case remove
	case getAll

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .set:
			return "set"
		case .get:
			return "get"
		case .add:
			return "add"
		case .delete:
			return "delete"
		case .remove:
			return "remove"
		case .getAll:
			return "getAll"

        }
    }
}

extension Jelly_UniversalVariableOperation {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
