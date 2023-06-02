//
//  Jelly_WFGetTextFromPDFTextType.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_WFGetTextFromPDFTextType: String, JellyEnum, Codable {
	case Text
	case RichText


    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }
    
    var value: String {
        switch self {
		case .Text:
			return "Text"
		case .RichText:
			return "Rich Text"

        }
    }
}

extension Jelly_WFGetTextFromPDFTextType {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
