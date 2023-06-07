//
//  Jelly_ImageKind.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_ImageKind: String, JellyEnum, Codable {
	case systemImage
	case image

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .systemImage:
			return "systemImage"
		case .image:
			return "image"

        }
    }
}

extension Jelly_ImageKind {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
