//
//  Jelly_WFRecordingEnd.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_WFRecordingEnd: String, JellyEnum, Codable {
	case OnTap
	case AfterTime


    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }
    
    var value: String {
        switch self {
		case .OnTap:
			return "On Tap"
		case .AfterTime:
			return "After Time"

        }
    }
}

extension Jelly_WFRecordingEnd {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
