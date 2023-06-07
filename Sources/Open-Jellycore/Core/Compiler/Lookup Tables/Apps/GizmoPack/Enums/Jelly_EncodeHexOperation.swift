//
//  Jelly_EncodeHexOperation.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_EncodeHexOperation: String, JellyEnum, Codable {
	case encode
	case decode

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .encode:
			return "encode"
		case .decode:
			return "decode"

        }
    }
}

extension Jelly_EncodeHexOperation {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
