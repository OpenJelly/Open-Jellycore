//
//  Jelly_PhotoOrientations.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_PhotoOrientations: String, JellyEnum, Codable {
	case landscape
	case portrait
	case squarish

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .landscape:
			return "landscape"
		case .portrait:
			return "portrait"
		case .squarish:
			return "squarish"

        }
    }
}

extension Jelly_PhotoOrientations {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
