//
//  Jelly_QueryRecordsOutput.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_QueryRecordsOutput: String, JellyEnum, Codable {
	case automatic
	case json
	case csv

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .automatic:
			return "automatic"
		case .json:
			return "json"
		case .csv:
			return "csv"

        }
    }
}

extension Jelly_QueryRecordsOutput {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
