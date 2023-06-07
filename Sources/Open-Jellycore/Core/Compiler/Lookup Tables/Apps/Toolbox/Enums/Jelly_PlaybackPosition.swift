//
//  Jelly_PlaybackPosition.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_PlaybackPosition: String, JellyEnum, Codable {
	case seekToPosition
	case skipForward
	case skipBack

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .seekToPosition:
			return "seekToPosition"
		case .skipForward:
			return "skipForward"
		case .skipBack:
			return "skipBack"

        }
    }
}

extension Jelly_PlaybackPosition {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
