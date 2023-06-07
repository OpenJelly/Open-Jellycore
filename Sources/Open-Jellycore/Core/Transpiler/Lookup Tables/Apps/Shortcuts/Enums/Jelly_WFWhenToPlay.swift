//
//  Jelly_WFWhenToPlay.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_WFWhenToPlay: String, JellyEnum, Codable {
	case Next
	case Later

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .Next:
			return "Next"
		case .Later:
			return "Later"

        }
    }
}

extension Jelly_WFWhenToPlay {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
