//
//  Jelly_PingServerOutput.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_PingServerOutput: String, JellyEnum, Codable {
	case statusCode
	case statusDescription
	case allHeaders
	case isOK
	case statusDictionary

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .statusCode:
			return "statusCode"
		case .statusDescription:
			return "statusDescription"
		case .allHeaders:
			return "allHeaders"
		case .isOK:
			return "isOK"
		case .statusDictionary:
			return "statusDictionary"

        }
    }
}

extension Jelly_PingServerOutput {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
