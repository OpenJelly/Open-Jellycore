//
//  Jelly_WFPDFIncludedPages.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_WFPDFIncludedPages: String, JellyEnum, Codable {
	case PageRange
	case AllPages
	case SinglePage


    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }
    
    var value: String {
        switch self {
		case .PageRange:
			return "Page Range"
		case .AllPages:
			return "All Pages"
		case .SinglePage:
			return "Single Page"

        }
    }
}

extension Jelly_WFPDFIncludedPages {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
