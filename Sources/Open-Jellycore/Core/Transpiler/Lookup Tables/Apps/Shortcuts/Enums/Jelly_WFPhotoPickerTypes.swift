//
//  Jelly_WFPhotoPickerTypes.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_WFPhotoPickerTypes: String, JellyEnum, Codable {
	case LivePhotos
	case Images
	case Videos


    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }
    
    var value: String {
        switch self {
		case .LivePhotos:
			return "Live Photos"
		case .Images:
			return "Images"
		case .Videos:
			return "Videos"

        }
    }
}

extension Jelly_WFPhotoPickerTypes {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
