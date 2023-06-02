//
//  Jelly_WFImageFormat.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_WFImageFormat: String, JellyEnum, Codable {
	case JPEG
	case PNG
	case TIFF
	case GIF
	case JPEGtwothousand
	case BMP
	case PDF
	case HEIF
	case MatchInput


    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }
    
    var value: String {
        switch self {
		case .JPEG:
			return "JPEG"
		case .PNG:
			return "PNG"
		case .TIFF:
			return "TIFF"
		case .GIF:
			return "GIF"
		case .JPEGtwothousand:
			return "JPEG-2000"
		case .BMP:
			return "BMP"
		case .PDF:
			return "PDF"
		case .HEIF:
			return "HEIF"
		case .MatchInput:
			return "Match Input"

        }
    }
}

extension Jelly_WFImageFormat {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
