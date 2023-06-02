//
//  Jelly_WFMakeImageFromPDFPageColorspace.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_WFMakeImageFromPDFPageColorspace: String, JellyEnum, Codable {
	case RGB
	case CMYK
	case Gray


    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }
    
    var value: String {
        switch self {
		case .RGB:
			return "RGB"
		case .CMYK:
			return "CMYK"
		case .Gray:
			return "Gray"

        }
    }
}

extension Jelly_WFMakeImageFromPDFPageColorspace {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
