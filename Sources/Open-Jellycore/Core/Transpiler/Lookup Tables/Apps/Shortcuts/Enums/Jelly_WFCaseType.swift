//
//  Jelly_WFCaseType.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_WFCaseType: String, JellyEnum, Codable {
	case uppercase
	case lowercase
	case everyword
	case titlecase
	case sentencecase
	case spongebob
	case alternating


    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }
    
    var value: String {
        switch self {
		case .uppercase:
			return "uppercase"
		case .lowercase:
			return "lowercase"
		case .everyword:
			return "every word"
		case .titlecase:
			return "title case"
		case .sentencecase:
			return "sentence case"
		case .spongebob:
			return "spongebob"
		case .alternating:
			return "alternating"

        }
    }
}

extension Jelly_WFCaseType {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
