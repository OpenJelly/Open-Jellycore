//
//  Jelly_AlbumSubType.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_AlbumSubType: String, JellyEnum, Codable {
	case All
	case SharediCloud
	case CameraImport
	case iCloudPhotoStream
	case Photos
	case Desktop

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .All:
			return "All"
		case .SharediCloud:
			return "SharediCloud"
		case .CameraImport:
			return "CameraImport"
		case .iCloudPhotoStream:
			return "iCloudPhotoStream"
		case .Photos:
			return "Photos"
		case .Desktop:
			return "Desktop"

        }
    }
}

extension Jelly_AlbumSubType {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
