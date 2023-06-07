//
//  Jelly_ArrayValueInsertionPoint.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_ArrayValueInsertionPoint: String, JellyEnum, Codable {
	case beginning
	case end
	case index

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .beginning:
			return "beginning"
		case .end:
			return "end"
		case .index:
			return "index"

        }
    }
}

extension Jelly_ArrayValueInsertionPoint {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
