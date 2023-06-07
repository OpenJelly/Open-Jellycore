//
//  Jelly_MotionType.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_MotionType: String, JellyEnum, Codable {
	case orientation
	case inMotion
	case motionType

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .orientation:
			return "orientation"
		case .inMotion:
			return "inMotion"
		case .motionType:
			return "motionType"

        }
    }
}

extension Jelly_MotionType {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
