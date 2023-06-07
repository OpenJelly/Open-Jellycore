//
//  Jelly_WFImportAudioFilesEncoder.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_WFImportAudioFilesEncoder: String, JellyEnum, Codable {
	case Default
	case AAC
	case AIFF
	case Lossless
	case MPthree
	case WAV

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .Default:
			return "Default"
		case .AAC:
			return "AAC"
		case .AIFF:
			return "AIFF"
		case .Lossless:
			return "Lossless"
		case .MPthree:
			return "MP3"
		case .WAV:
			return "WAV"

        }
    }
}

extension Jelly_WFImportAudioFilesEncoder {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
