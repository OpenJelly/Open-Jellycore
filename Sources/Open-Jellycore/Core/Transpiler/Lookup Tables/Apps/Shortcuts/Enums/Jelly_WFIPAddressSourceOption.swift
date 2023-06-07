//
//  Jelly_WFIPAddressSourceOption.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_WFIPAddressSourceOption: String, JellyEnum, Codable {
	case Local
	case External

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .Local:
			return "Local"
		case .External:
			return "External"

        }
    }
}

extension Jelly_WFIPAddressSourceOption {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
