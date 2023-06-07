//
//  Jelly_FilterType.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_FilterType: String, JellyEnum, Codable {
	case sepia
	case desaturate
	case pixellate
	case blur
	case chrome
	case fade
	case instant
	case mono
	case noir
	case process
	case tonal
	case transfer

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .sepia:
			return "sepia"
		case .desaturate:
			return "desaturate"
		case .pixellate:
			return "pixellate"
		case .blur:
			return "blur"
		case .chrome:
			return "chrome"
		case .fade:
			return "fade"
		case .instant:
			return "instant"
		case .mono:
			return "mono"
		case .noir:
			return "noir"
		case .process:
			return "process"
		case .tonal:
			return "tonal"
		case .transfer:
			return "transfer"

        }
    }
}

extension Jelly_FilterType {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
