//
//  Jelly_StageType.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_StageType: String, JellyEnum, Codable {
	case working
	case onBreak
	case planning

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .working:
			return "working"
		case .onBreak:
			return "onBreak"
		case .planning:
			return "planning"

        }
    }
}

extension Jelly_StageType {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
