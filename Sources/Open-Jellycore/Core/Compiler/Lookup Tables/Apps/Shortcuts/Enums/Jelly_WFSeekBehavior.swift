//
//  Jelly_WFSeekBehavior.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_WFSeekBehavior: String, JellyEnum, Codable {
	case ToTime
	case ForwardBy
	case BackwardBy

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .ToTime:
			return "To Time"
		case .ForwardBy:
			return "Forward By"
		case .BackwardBy:
			return "Backward By"

        }
    }
}

extension Jelly_WFSeekBehavior {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
