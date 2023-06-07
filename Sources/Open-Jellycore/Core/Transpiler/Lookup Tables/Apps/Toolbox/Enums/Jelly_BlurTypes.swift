//
//  Jelly_BlurTypes.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_BlurTypes: String, JellyEnum, Codable {
	case Gaussian
	case Box

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .Gaussian:
			return "Gaussian"
		case .Box:
			return "Box"

        }
    }
}

extension Jelly_BlurTypes {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
