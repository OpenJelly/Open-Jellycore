//
//  Jelly_WFCountType.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_WFCountType: String, JellyEnum, Codable {
	case Characters
	case Items
	case Words
	case Sentences
	case Lines


    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }
    
    var value: String {
        switch self {
		case .Characters:
			return "Characters"
		case .Items:
			return "Items"
		case .Words:
			return "Words"
		case .Sentences:
			return "Sentences"
		case .Lines:
			return "Lines"

        }
    }
}

extension Jelly_WFCountType {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
