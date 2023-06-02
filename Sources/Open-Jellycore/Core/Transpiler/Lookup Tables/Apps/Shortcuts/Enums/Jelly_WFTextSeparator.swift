//
//  Jelly_WFTextSeparator.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_WFTextSeparator: String, JellyEnum, Codable {
	case NewLines
	case Spaces
	case EveryCharacter
	case Custom


    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }
    
    var value: String {
        switch self {
		case .NewLines:
			return "New Lines"
		case .Spaces:
			return "Spaces"
		case .EveryCharacter:
			return "Every Character"
		case .Custom:
			return "Custom"

        }
    }
}

extension Jelly_WFTextSeparator {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
