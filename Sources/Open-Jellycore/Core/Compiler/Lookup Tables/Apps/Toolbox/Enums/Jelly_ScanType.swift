//
//  Jelly_ScanType.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_ScanType: String, JellyEnum, Codable {
	case text
	case scans

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .text:
			return "text"
		case .scans:
			return "scans"

        }
    }
}

extension Jelly_ScanType {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
