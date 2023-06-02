//
//  Jelly_WFSSHAuthenticationType.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_WFSSHAuthenticationType: String, JellyEnum, Codable {
	case Password
	case SSHKey


    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }
    
    var value: String {
        switch self {
		case .Password:
			return "Password"
		case .SSHKey:
			return "SSH Key"

        }
    }
}

extension Jelly_WFSSHAuthenticationType {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
