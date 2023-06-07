//
//  Jelly_WFFileSizeFormat.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_WFFileSizeFormat: String, JellyEnum, Codable {
	case Automatic
	case bytes
	case kb
	case mb
	case gb
	case tb
	case pb
	case eb
	case zb
	case yb

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .Automatic:
			return "Automatic"
		case .bytes:
			return "bytes"
		case .kb:
			return "kb"
		case .mb:
			return "mb"
		case .gb:
			return "gb"
		case .tb:
			return "tb"
		case .pb:
			return "pb"
		case .eb:
			return "eb"
		case .zb:
			return "zb"
		case .yb:
			return "yb"

        }
    }
}

extension Jelly_WFFileSizeFormat {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
