//
//  Jelly_PluraliseOutput.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_PluraliseOutput: String, JellyEnum, Codable {
	case word
	case numberDigit
	case numberText

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .word:
			return "word"
		case .numberDigit:
			return "numberDigit"
		case .numberText:
			return "numberText"

        }
    }
}

extension Jelly_PluraliseOutput {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
