//
//  Jelly_BlurFilterType.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_BlurFilterType: String, JellyEnum, Codable {
	case Gaussian
	case Box
	case Pixellation

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .Gaussian:
			return "Gaussian"
		case .Box:
			return "Box"
		case .Pixellation:
			return "Pixellation"

        }
    }
}

extension Jelly_BlurFilterType {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
