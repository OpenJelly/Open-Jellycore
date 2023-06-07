//
//  Jelly_WFRecordingStart.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_WFRecordingStart: String, JellyEnum, Codable {
	case OnTap
	case Immediately

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .OnTap:
			return "On Tap"
		case .Immediately:
			return "Immediately"

        }
    }
}

extension Jelly_WFRecordingStart {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
