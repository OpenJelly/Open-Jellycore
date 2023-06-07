//
//  Jelly_ConsoleMode.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_ConsoleMode: String, JellyEnum, Codable {
	case Print
	case Retrieve
	case Clear

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .Print:
			return "Print"
		case .Retrieve:
			return "Retrieve"
		case .Clear:
			return "Clear"

        }
    }
}

extension Jelly_ConsoleMode {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
