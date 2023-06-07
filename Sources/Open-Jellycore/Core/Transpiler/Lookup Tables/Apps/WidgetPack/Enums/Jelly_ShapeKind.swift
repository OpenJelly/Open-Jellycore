//
//  Jelly_ShapeKind.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_ShapeKind: String, JellyEnum, Codable {
	case circle
	case capsule
	case containerRelative
	case ellipse
	case rectangle
	case roundedRectangle

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .circle:
			return "circle"
		case .capsule:
			return "capsule"
		case .containerRelative:
			return "containerRelative"
		case .ellipse:
			return "ellipse"
		case .rectangle:
			return "rectangle"
		case .roundedRectangle:
			return "roundedRectangle"

        }
    }
}

extension Jelly_ShapeKind {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
