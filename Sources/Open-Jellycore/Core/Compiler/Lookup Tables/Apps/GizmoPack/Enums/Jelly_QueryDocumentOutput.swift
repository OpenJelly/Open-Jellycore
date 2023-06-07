//
//  Jelly_QueryDocumentOutput.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_QueryDocumentOutput: String, JellyEnum, Codable {
	case text
	case html_xml

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .text:
			return "text"
		case .html_xml:
			return "html_xml"

        }
    }
}

extension Jelly_QueryDocumentOutput {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
