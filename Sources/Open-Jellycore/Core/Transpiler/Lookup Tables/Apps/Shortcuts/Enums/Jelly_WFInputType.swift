//
//  Jelly_WFInputType.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_WFInputType: String, JellyEnum, Codable {
	case Text
	case URL
	case Number
	case Date
	case Time
	case DateandTime


    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }
    
    var value: String {
        switch self {
		case .Text:
			return "Text"
		case .URL:
			return "URL"
		case .Number:
			return "Number"
		case .Date:
			return "Date"
		case .Time:
			return "Time"
		case .DateandTime:
			return "Date and Time"

        }
    }
}

extension Jelly_WFInputType {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
