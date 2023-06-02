//
//  Jelly_WFPlayMusicActionRepeat.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_WFPlayMusicActionRepeat: String, JellyEnum, Codable {
	case None
	case One
	case All


    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }
    
    var value: String {
        switch self {
		case .None:
			return "None"
		case .One:
			return "One"
		case .All:
			return "All"

        }
    }
}

extension Jelly_WFPlayMusicActionRepeat {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
