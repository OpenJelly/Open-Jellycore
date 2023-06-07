//
//  Jelly_PreviewImageMask.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_PreviewImageMask: String, JellyEnum, Codable {
	case `default`
	case rounded
	case circular

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .`default`:
			return "default"
		case .rounded:
			return "rounded"
		case .circular:
			return "circular"

        }
    }
}

extension Jelly_PreviewImageMask {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
