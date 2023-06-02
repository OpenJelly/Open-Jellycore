//
//  Jelly_WFArchiveFormat.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_WFArchiveFormat: String, JellyEnum, Codable {
	case zip
	case targz
	case tarbztwo
	case tarxz
	case tar
	case gz
	case cpio
	case iso


    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }
    
    var value: String {
        switch self {
		case .zip:
			return ".zip"
		case .targz:
			return ".tar.gz"
		case .tarbztwo:
			return ".tar.bz2"
		case .tarxz:
			return ".tar.xz"
		case .tar:
			return ".tar"
		case .gz:
			return ".gz"
		case .cpio:
			return ".cpio"
		case .iso:
			return ".iso"

        }
    }
}

extension Jelly_WFArchiveFormat {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
