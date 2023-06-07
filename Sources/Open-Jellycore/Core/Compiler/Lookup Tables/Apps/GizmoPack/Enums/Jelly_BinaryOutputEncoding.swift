//
//  Jelly_BinaryOutputEncoding.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_BinaryOutputEncoding: String, JellyEnum, Codable {
	case binary
	case hex
	case basesixtyfour

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .binary:
			return "binary"
		case .hex:
			return "hex"
		case .basesixtyfour:
			return "base64"

        }
    }
}

extension Jelly_BinaryOutputEncoding {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
