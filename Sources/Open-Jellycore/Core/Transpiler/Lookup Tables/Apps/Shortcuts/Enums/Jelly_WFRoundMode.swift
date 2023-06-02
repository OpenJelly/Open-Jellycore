//
//  Jelly_WFRoundMode.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_WFRoundMode: String, JellyEnum, Codable {
	case Normal
	case AlwaysRoundUp
	case AlwaysRoundDown


    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }
    
    var value: String {
        switch self {
		case .Normal:
			return "Normal"
		case .AlwaysRoundUp:
			return "Always Round Up"
		case .AlwaysRoundDown:
			return "Always Round Down"

        }
    }
}

extension Jelly_WFRoundMode {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
