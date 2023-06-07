//
//  Jelly_PreviewImageSize.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_PreviewImageSize: String, JellyEnum, Codable {
	case fullWidth
	case thumb
	case small
	case medium
	case large
	case actual

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .fullWidth:
			return "fullWidth"
		case .thumb:
			return "thumb"
		case .small:
			return "small"
		case .medium:
			return "medium"
		case .large:
			return "large"
		case .actual:
			return "actual"

        }
    }
}

extension Jelly_PreviewImageSize {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
