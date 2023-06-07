//
//  Jelly_WFSearchWebDestination.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_WFSearchWebDestination: String, JellyEnum, Codable {
	case Amazon
	case Bing
	case DuckDuckGo
	case eBay
	case Google
	case Reddit
	case Twitter
	case Yahoo
	case YouTube

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .Amazon:
			return "Amazon"
		case .Bing:
			return "Bing"
		case .DuckDuckGo:
			return "DuckDuckGo"
		case .eBay:
			return "eBay"
		case .Google:
			return "Google"
		case .Reddit:
			return "Reddit"
		case .Twitter:
			return "Twitter"
		case .Yahoo:
			return "Yahoo"
		case .YouTube:
			return "YouTube"

        }
    }
}

extension Jelly_WFSearchWebDestination {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
