//
//  Jelly_TrimFilePosition.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_TrimFilePosition: String, JellyEnum, Codable {
	case begin
	case end
	case beginEnd

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .begin:
			return "begin"
		case .end:
			return "end"
		case .beginEnd:
			return "beginEnd"

        }
    }
}

extension Jelly_TrimFilePosition {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
