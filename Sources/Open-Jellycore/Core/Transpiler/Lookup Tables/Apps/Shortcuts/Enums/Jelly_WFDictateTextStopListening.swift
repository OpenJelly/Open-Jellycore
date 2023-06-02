//
//  Jelly_WFDictateTextStopListening.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_WFDictateTextStopListening: String, JellyEnum, Codable {
	case AfterPause
	case AfterShortPause
	case OnTap


    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }
    
    var value: String {
        switch self {
		case .AfterPause:
			return "After Pause"
		case .AfterShortPause:
			return "After Short Pause"
		case .OnTap:
			return "On Tap"

        }
    }
}

extension Jelly_WFDictateTextStopListening {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
