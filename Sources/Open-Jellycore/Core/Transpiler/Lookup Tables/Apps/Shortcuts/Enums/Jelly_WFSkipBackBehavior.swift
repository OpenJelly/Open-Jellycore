//
//  Jelly_WFSkipBackBehavior.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_WFSkipBackBehavior: String, JellyEnum, Codable {
	case Beginning
	case PreviousSong

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .Beginning:
			return "Beginning"
		case .PreviousSong:
			return "Previous Song"

        }
    }
}

extension Jelly_WFSkipBackBehavior {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
