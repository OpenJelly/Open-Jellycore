//
//  Jelly_CheckAppMode.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_CheckAppMode: String, JellyEnum, Codable {
	case SingleBool
	case AllAsDict
	case listOfApps
	case URLSchemeDict

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .SingleBool:
			return "SingleBool"
		case .AllAsDict:
			return "AllAsDict"
		case .listOfApps:
			return "listOfApps"
		case .URLSchemeDict:
			return "URLSchemeDict"

        }
    }
}

extension Jelly_CheckAppMode {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
