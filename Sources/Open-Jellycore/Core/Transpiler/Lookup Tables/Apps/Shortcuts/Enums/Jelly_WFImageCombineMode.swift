//
//  Jelly_WFImageCombineMode.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_WFImageCombineMode: String, JellyEnum, Codable {
	case Vertically
	case Horizontally
	case Inagrid


    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }
    
    var value: String {
        switch self {
		case .Vertically:
			return "Vertically"
		case .Horizontally:
			return "Horizontally"
		case .Inagrid:
			return "In a grid"

        }
    }
}

extension Jelly_WFImageCombineMode {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
