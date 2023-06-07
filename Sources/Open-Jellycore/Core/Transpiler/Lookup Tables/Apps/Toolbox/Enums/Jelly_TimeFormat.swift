//
//  Jelly_TimeFormat.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_TimeFormat: String, JellyEnum, Codable {
	case ampm
	case hourstwelve
	case hourstwentyfour
	case minutes

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .ampm:
			return "ampm"
		case .hourstwelve:
			return "hours12"
		case .hourstwentyfour:
			return "hours24"
		case .minutes:
			return "minutes"

        }
    }
}

extension Jelly_TimeFormat {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
