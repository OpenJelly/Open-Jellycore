//
//  Jelly_WFDateSpecifier.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_WFDateSpecifier: String, JellyEnum, Codable {
	case Today
	case AnyDay
	case Tomorrow
	case SpecifiedDay


    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }
    
    var value: String {
        switch self {
		case .Today:
			return "Today"
		case .AnyDay:
			return "Any Day"
		case .Tomorrow:
			return "Tomorrow"
		case .SpecifiedDay:
			return "Specified Day"

        }
    }
}

extension Jelly_WFDateSpecifier {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
