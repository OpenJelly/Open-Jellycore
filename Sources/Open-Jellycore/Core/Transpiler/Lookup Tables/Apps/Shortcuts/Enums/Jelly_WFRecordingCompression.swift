//
//  Jelly_WFRecordingCompression.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_WFRecordingCompression: String, JellyEnum, Codable {
	case Normal
	case VeryHigh


    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }
    
    var value: String {
        switch self {
		case .Normal:
			return "Normal"
		case .VeryHigh:
			return "Very High"

        }
    }
}

extension Jelly_WFRecordingCompression {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
