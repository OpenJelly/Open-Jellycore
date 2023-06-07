//
//  Jelly_DocumentQueryType.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_DocumentQueryType: String, JellyEnum, Codable {
	case css
	case xpath

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .css:
			return "css"
		case .xpath:
			return "xpath"

        }
    }
}

extension Jelly_DocumentQueryType {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
