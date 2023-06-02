//
//  Jelly_WFPlayPauseBehavior.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_WFPlayPauseBehavior: String, JellyEnum, Codable {
	case Play
	case Pause
	case PlayPause


    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }
    
    var value: String {
        switch self {
		case .Play:
			return "Play"
		case .Pause:
			return "Pause"
		case .PlayPause:
			return "Play/Pause"

        }
    }
}

extension Jelly_WFPlayPauseBehavior {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
