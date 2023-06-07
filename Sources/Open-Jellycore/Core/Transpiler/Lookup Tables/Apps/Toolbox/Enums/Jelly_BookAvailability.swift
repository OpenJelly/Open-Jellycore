//
//  Jelly_BookAvailability.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_BookAvailability: String, JellyEnum, Codable {
	case all
	case eBooks
	case freeEbooks
	case paidEbooks
	case fullText
	case partialText

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .all:
			return "all"
		case .eBooks:
			return "eBooks"
		case .freeEbooks:
			return "freeEbooks"
		case .paidEbooks:
			return "paidEbooks"
		case .fullText:
			return "fullText"
		case .partialText:
			return "partialText"

        }
    }
}

extension Jelly_BookAvailability {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
