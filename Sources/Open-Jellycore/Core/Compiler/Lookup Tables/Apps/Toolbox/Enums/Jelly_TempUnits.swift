//
//  Jelly_TempUnits.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_TempUnits: String, JellyEnum, Codable {
	case Celsius
	case Farenheit

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .Celsius:
			return "Celsius"
		case .Farenheit:
			return "Farenheit"

        }
    }
}

extension Jelly_TempUnits {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
