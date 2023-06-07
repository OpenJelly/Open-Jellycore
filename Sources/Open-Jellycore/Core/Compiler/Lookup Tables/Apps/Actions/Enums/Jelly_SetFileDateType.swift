//
//  Jelly_SetFileDateType.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_SetFileDateType: String, JellyEnum, Codable {
	case creationDate
	case modificationDate
	case both

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .creationDate:
			return "creationDate"
		case .modificationDate:
			return "modificationDate"
		case .both:
			return "both"

        }
    }
}

extension Jelly_SetFileDateType {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
