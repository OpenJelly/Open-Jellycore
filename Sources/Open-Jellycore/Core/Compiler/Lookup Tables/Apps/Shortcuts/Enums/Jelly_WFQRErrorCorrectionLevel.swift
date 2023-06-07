//
//  Jelly_WFQRErrorCorrectionLevel.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_WFQRErrorCorrectionLevel: String, JellyEnum, Codable {
	case Low
	case Medium
	case Quartile
	case High

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .Low:
			return "Low"
		case .Medium:
			return "Medium"
		case .Quartile:
			return "Quartile"
		case .High:
			return "High"

        }
    }
}

extension Jelly_WFQRErrorCorrectionLevel {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
