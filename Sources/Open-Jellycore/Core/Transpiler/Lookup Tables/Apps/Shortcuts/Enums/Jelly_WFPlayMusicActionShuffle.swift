//
//  Jelly_WFPlayMusicActionShuffle.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_WFPlayMusicActionShuffle: String, JellyEnum, Codable {
	case Off
	case Songs


    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }
    
    var value: String {
        switch self {
		case .Off:
			return "Off"
		case .Songs:
			return "Songs"

        }
    }
}

extension Jelly_WFPlayMusicActionShuffle {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
