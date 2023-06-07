//
//  Jelly_CombineText.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_CombineText: String, JellyEnum, Codable {
	case NewLines
	case Spaces
	case Commas
	case CommaSpace
	case DoubleNewLines
	case Custom

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .NewLines:
			return "NewLines"
		case .Spaces:
			return "Spaces"
		case .Commas:
			return "Commas"
		case .CommaSpace:
			return "CommaSpace"
		case .DoubleNewLines:
			return "DoubleNewLines"
		case .Custom:
			return "Custom"

        }
    }
}

extension Jelly_CombineText {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
