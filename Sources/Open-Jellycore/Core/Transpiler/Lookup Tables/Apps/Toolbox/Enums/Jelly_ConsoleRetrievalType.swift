//
//  Jelly_ConsoleRetrievalType.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_ConsoleRetrievalType: String, JellyEnum, Codable {
	case List
	case IndividualEntries

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .List:
			return "List"
		case .IndividualEntries:
			return "IndividualEntries"

        }
    }
}

extension Jelly_ConsoleRetrievalType {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
