//
//  Jelly_NFCMode.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_NFCMode: String, JellyEnum, Codable {
	case Read
	case Overwrite

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .Read:
			return "Read"
		case .Overwrite:
			return "Overwrite"

        }
    }
}

extension Jelly_NFCMode {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
