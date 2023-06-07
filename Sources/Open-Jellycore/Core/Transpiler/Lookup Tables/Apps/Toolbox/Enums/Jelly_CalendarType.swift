//
//  Jelly_CalendarType.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_CalendarType: String, JellyEnum, Codable {
	case Local
	case iCloud

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .Local:
			return "Local"
		case .iCloud:
			return "iCloud"

        }
    }
}

extension Jelly_CalendarType {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
