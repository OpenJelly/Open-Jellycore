//
//  Jelly_Property.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_Property: String, JellyEnum, Codable {
	case background
	case overlay
	case foregroundColor
	case accentColor
	case font
	case scaledToFill
	case scaledToFit
	case padding
	case clipShape
	case opacity
	case brightness
	case contrast
	case colorInvert
	case saturation
	case grayscale
	case mask
	case fixedFrame
	case minimumScaleFactor
	case relativeFrame
	case clipped
	case fixedSize

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .background:
			return "background"
		case .overlay:
			return "overlay"
		case .foregroundColor:
			return "foregroundColor"
		case .accentColor:
			return "accentColor"
		case .font:
			return "font"
		case .scaledToFill:
			return "scaledToFill"
		case .scaledToFit:
			return "scaledToFit"
		case .padding:
			return "padding"
		case .clipShape:
			return "clipShape"
		case .opacity:
			return "opacity"
		case .brightness:
			return "brightness"
		case .contrast:
			return "contrast"
		case .colorInvert:
			return "colorInvert"
		case .saturation:
			return "saturation"
		case .grayscale:
			return "grayscale"
		case .mask:
			return "mask"
		case .fixedFrame:
			return "fixedFrame"
		case .minimumScaleFactor:
			return "minimumScaleFactor"
		case .relativeFrame:
			return "relativeFrame"
		case .clipped:
			return "clipped"
		case .fixedSize:
			return "fixedSize"

        }
    }
}

extension Jelly_Property {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
