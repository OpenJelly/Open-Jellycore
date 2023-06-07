//
//  Jelly_SystemSounds.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_SystemSounds: String, JellyEnum, Codable {
	case tink
	case mailSent
	case newMail
	case receivedMessage
	case smsReceivedone
	case smsReceivedtwo
	case smsReceivedthree
	case smsReceivedfour
	case smsReceivedfive
	case smsReceivedsix
	case sentMessage
	case tock
	case photoShutter
	case lock
	case shake
	case alarm
	case push
	case pop
	case paymentSuccess
	case paymentFailure
	case shortLowHigh
	case shortDoubleLow
	case shortDoubleHigh
	case lowPower
	case focusChangeSmall
	case focusChangeLarge
	case connectPower
	case tweetSent

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .tink:
			return "tink"
		case .mailSent:
			return "mailSent"
		case .newMail:
			return "newMail"
		case .receivedMessage:
			return "receivedMessage"
		case .smsReceivedone:
			return "smsReceived1"
		case .smsReceivedtwo:
			return "smsReceived2"
		case .smsReceivedthree:
			return "smsReceived3"
		case .smsReceivedfour:
			return "smsReceived4"
		case .smsReceivedfive:
			return "smsReceived5"
		case .smsReceivedsix:
			return "smsReceived6"
		case .sentMessage:
			return "sentMessage"
		case .tock:
			return "tock"
		case .photoShutter:
			return "photoShutter"
		case .lock:
			return "lock"
		case .shake:
			return "shake"
		case .alarm:
			return "alarm"
		case .push:
			return "push"
		case .pop:
			return "pop"
		case .paymentSuccess:
			return "paymentSuccess"
		case .paymentFailure:
			return "paymentFailure"
		case .shortLowHigh:
			return "shortLowHigh"
		case .shortDoubleLow:
			return "shortDoubleLow"
		case .shortDoubleHigh:
			return "shortDoubleHigh"
		case .lowPower:
			return "lowPower"
		case .focusChangeSmall:
			return "focusChangeSmall"
		case .focusChangeLarge:
			return "focusChangeLarge"
		case .connectPower:
			return "connectPower"
		case .tweetSent:
			return "tweetSent"

        }
    }
}

extension Jelly_SystemSounds {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
