//
//  Jelly_WFFaceTimeType.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_WFFaceTimeType: String, JellyEnum, Codable {
	case Video
	case Audio


    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }
    
    var value: String {
        switch self {
		case .Video:
			return "Video"
		case .Audio:
			return "Audio"

        }
    }
}

extension Jelly_WFFaceTimeType {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
