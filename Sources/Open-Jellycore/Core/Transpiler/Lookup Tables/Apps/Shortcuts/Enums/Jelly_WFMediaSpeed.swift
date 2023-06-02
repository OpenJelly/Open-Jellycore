//
//  Jelly_WFMediaSpeed.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_WFMediaSpeed: String, JellyEnum, Codable {
	case fiveX
	case Normal
	case twoX
	case Custom


    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }
    
    var value: String {
        switch self {
		case .fiveX:
			return "0.5X"
		case .Normal:
			return "Normal"
		case .twoX:
			return "2X"
		case .Custom:
			return "Custom"

        }
    }
}

extension Jelly_WFMediaSpeed {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
