//
//  Jelly_BookmarkFolderMode.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_BookmarkFolderMode: String, JellyEnum, Codable {
	case bookmarkFolder
	case getFiles
	case getFilesURL
	case listContents
	case saveFiles
	case getBookmarks
	case deleteBookmark
	case deleteAll
	case deleteFiles
	case OpenInFiles
	case createFolder
	case moveFiles
	case rename
	case tagFiles
	case startDownloading

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .bookmarkFolder:
			return "bookmarkFolder"
		case .getFiles:
			return "getFiles"
		case .getFilesURL:
			return "getFilesURL"
		case .listContents:
			return "listContents"
		case .saveFiles:
			return "saveFiles"
		case .getBookmarks:
			return "getBookmarks"
		case .deleteBookmark:
			return "deleteBookmark"
		case .deleteAll:
			return "deleteAll"
		case .deleteFiles:
			return "deleteFiles"
		case .OpenInFiles:
			return "OpenInFiles"
		case .createFolder:
			return "createFolder"
		case .moveFiles:
			return "moveFiles"
		case .rename:
			return "rename"
		case .tagFiles:
			return "tagFiles"
		case .startDownloading:
			return "startDownloading"

        }
    }
}

extension Jelly_BookmarkFolderMode {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
