//
//  Jelly_WFSpeakTextVoice.swift
//  JellycoreV2
//
//  Created by Taylor Lineman on 1/2/23.
//

enum Jelly_WFSpeakTextVoice: String, JellyEnum, Codable {
    case Alex
    case Fred
    case Samantha
    case Victoria
    case Rishi
    case Veena
    case Alice
    case Luca
    case Milena
    case Yuri
    case Juan
    case Paulina
    
    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }
    
    var value: String {
        switch self {
        case .Alex:
            return "com.apple.speech.synthesis.voice.alex"
        case .Fred:
            return "com.apple.speech.synthesis.voice.fred"
        case .Samantha:
            return "com.apple.speech.synthesis.voice.samantha"
        case .Victoria:
            return "com.apple.speech.synthesis.voice.victoria"
        case .Rishi:
            return "com.apple.speech.synthesis.voice.rishi"
        case .Veena:
            return "com.apple.speech.synthesis.voice.veena"
        case .Alice:
            return "com.apple.speech.synthesis.voice.alice"
        case .Luca:
            return "com.apple.speech.synthesis.voice.luca"
        case .Milena:
            return "com.apple.speech.synthesis.voice.milena"
        case .Yuri:
            return "com.apple.speech.synthesis.voice.yuri"
        case .Juan:
            return "com.apple.speech.synthesis.voice.juan"
        case .Paulina:
            return "com.apple.speech.synthesis.voice.paulina"
        }
    }
}

extension Jelly_WFSpeakTextVoice {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
