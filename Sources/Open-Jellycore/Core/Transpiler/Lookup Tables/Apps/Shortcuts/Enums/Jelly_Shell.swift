//
//  Jelly_Shell.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_Shell: String, JellyEnum, Codable {
	case binbash
	case bincsh
	case binksh
	case binsh
	case bintcsh
	case binzsh
	case usrbinpearl
	case usrbinpython
	case usrbinruby
	case usrbinswift

    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }

    var value: String {
        switch self {
		case .binbash:
			return "/bin/bash"
		case .bincsh:
			return "/bin/csh"
		case .binksh:
			return "/bin/ksh"
		case .binsh:
			return "/bin/sh"
		case .bintcsh:
			return "/bin/tcsh"
		case .binzsh:
			return "/bin/zsh"
		case .usrbinpearl:
			return "/usr/bin/pearl"
		case .usrbinpython:
			return "/usr/bin/python"
		case .usrbinruby:
			return "/usr/bin/ruby"
		case .usrbinswift:
			return "/usr/bin/swift"

        }
    }
}

extension Jelly_Shell {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
