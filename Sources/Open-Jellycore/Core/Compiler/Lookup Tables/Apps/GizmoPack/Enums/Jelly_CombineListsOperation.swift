//
//  Jelly_CombineListsOperation.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_CombineListsOperation: String, JellyEnum, Codable {
	case join
	case intersect
	case subtract

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .join:
			return "join"
		case .intersect:
			return "intersect"
		case .subtract:
			return "subtract"

        }
    }
}

extension Jelly_CombineListsOperation {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
