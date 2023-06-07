//
//  Jelly_PhotoScaleType.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_PhotoScaleType: String, JellyEnum, Codable {
	case fit
	case fillEntropy
	case fillFaces
	case fillEdges
	case fillCentre

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .fit:
			return "fit"
		case .fillEntropy:
			return "fillEntropy"
		case .fillFaces:
			return "fillFaces"
		case .fillEdges:
			return "fillEdges"
		case .fillCentre:
			return "fillCentre"

        }
    }
}

extension Jelly_PhotoScaleType {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
