//
//  Jelly_VariableFilters.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_VariableFilters: String, JellyEnum, Codable {
	case All
	case Basesixtyfour
	case Bool
	case Image
	case JSON
	case Number
	case Text

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .All:
			return "All"
		case .Basesixtyfour:
			return "Base64"
		case .Bool:
			return "Bool"
		case .Image:
			return "Image"
		case .JSON:
			return "JSON"
		case .Number:
			return "Number"
		case .Text:
			return "Text"

        }
    }
}

extension Jelly_VariableFilters {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
