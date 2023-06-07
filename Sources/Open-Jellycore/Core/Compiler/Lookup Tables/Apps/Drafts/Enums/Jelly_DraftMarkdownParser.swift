//
//  Jelly_DraftMarkdownParser.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_DraftMarkdownParser: String, JellyEnum, Codable {
	case multimarkdown
	case githubmarkdown

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .multimarkdown:
			return "multimarkdown"
		case .githubmarkdown:
			return "githubmarkdown"

        }
    }
}

extension Jelly_DraftMarkdownParser {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
