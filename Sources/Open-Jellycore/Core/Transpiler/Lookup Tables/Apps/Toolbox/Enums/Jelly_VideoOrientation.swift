//
//  Jelly_VideoOrientation.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_VideoOrientation: String, JellyEnum, Codable {
	case all
	case landscape
	case portrait
	case square

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .all:
			return "all"
		case .landscape:
			return "landscape"
		case .portrait:
			return "portrait"
		case .square:
			return "square"

        }
    }
}

extension Jelly_VideoOrientation {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
