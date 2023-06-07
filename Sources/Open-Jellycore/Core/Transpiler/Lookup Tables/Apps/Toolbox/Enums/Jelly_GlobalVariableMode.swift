//
//  Jelly_GlobalVariableMode.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_GlobalVariableMode: String, JellyEnum, Codable {
	case Set
	case Add
	case Get
	case GetAll
	case ClearSingle
	case ClearAll
	case AddToDict
	case GetFromDict

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .Set:
			return "Set"
		case .Add:
			return "Add"
		case .Get:
			return "Get"
		case .GetAll:
			return "GetAll"
		case .ClearSingle:
			return "ClearSingle"
		case .ClearAll:
			return "ClearAll"
		case .AddToDict:
			return "AddToDict"
		case .GetFromDict:
			return "GetFromDict"

        }
    }
}

extension Jelly_GlobalVariableMode {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
