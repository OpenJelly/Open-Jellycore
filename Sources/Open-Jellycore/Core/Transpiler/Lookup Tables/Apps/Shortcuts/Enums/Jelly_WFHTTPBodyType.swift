//
//  Jelly_WFHTTPBodyType.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_WFHTTPBodyType: String, JellyEnum, Codable {
	case Json
	case Form
	case File


    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }
    
    var value: String {
        switch self {
		case .Json:
			return "Json"
		case .Form:
			return "Form"
		case .File:
			return "File"

        }
    }
}

extension Jelly_WFHTTPBodyType {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
