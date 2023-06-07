//
//  Jelly_EditTextMode.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_EditTextMode: String, JellyEnum, Codable {
	case overwriting
	case prepending
	case appending
	case replacing
	case insertingAtLine

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .overwriting:
			return "overwriting"
		case .prepending:
			return "prepending"
		case .appending:
			return "appending"
		case .replacing:
			return "replacing"
		case .insertingAtLine:
			return "insertingAtLine"

        }
    }
}

extension Jelly_EditTextMode {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
