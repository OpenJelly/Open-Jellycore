//
//  Jelly_WFAskActionDefaultAnswer.swift
//  JellycoreV2
//
//  Created by Taylor Lineman on 1/2/23.
//

enum Jelly_WFAskActionDefaultAnswer: String, JellyEnum, Codable {
    case Text
    case URL
    case Number
    case Date
    case Time
    case DateAndTime
    
    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }
    
    var value: String {
        switch self {
        case .Text:
            return "WFAskActionDefaultAnswer"
        case .URL:
            return "WFAskActionDefaultAnswerURL"
        case .Number:
            return "WFAskActionDefaultAnswer"
        case .Date:
            return "WFAskActionDefaultAnswerDate"
        case .Time:
            return "WFAskActionDefaultAnswerTime"
        case .DateAndTime:
            return "WFAskActionDefaultAnswerDateAndTime"
        }
    }
}

extension Jelly_WFAskActionDefaultAnswer {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
