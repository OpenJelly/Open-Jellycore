//
//  Jelly_WFMediaAudioFormat.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_WFMediaAudioFormat: String, JellyEnum, Codable {
	case MfourA
	case AIFF

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .MfourA:
			return "M4A"
		case .AIFF:
			return "AIFF"

        }
    }
}

extension Jelly_WFMediaAudioFormat {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
