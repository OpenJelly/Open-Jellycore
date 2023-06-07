//
//  Jelly_TextDetailType.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_TextDetailType: String, JellyEnum, Codable {
	case peopleNames
	case placeNames
	case language
	case sentiment
	case organisations
	case lemma
	case partOfSpeech
	case sentences
	case paragraphs

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .peopleNames:
			return "peopleNames"
		case .placeNames:
			return "placeNames"
		case .language:
			return "language"
		case .sentiment:
			return "sentiment"
		case .organisations:
			return "organisations"
		case .lemma:
			return "lemma"
		case .partOfSpeech:
			return "partOfSpeech"
		case .sentences:
			return "sentences"
		case .paragraphs:
			return "paragraphs"

        }
    }
}

extension Jelly_TextDetailType {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
