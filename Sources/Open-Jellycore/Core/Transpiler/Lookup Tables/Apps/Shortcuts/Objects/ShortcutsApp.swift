//
//  ShortcutsApp.swift
//  JellycoreV2
//
//  Created by Taylor Lineman on 1/2/23.
//

/// Models WFApp
struct ShortcutsApp: JellyAny, Codable {
    var bundleIdentifier: String
    var name: String
    var teamIdentifier: String = "0000000000"
    
    init(_ value: CoreNode, scopedVariables: [Variable]) {
        self.bundleIdentifier = value.content
        self.name = value.content
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(bundleIdentifier, forKey: .bundleIdentifier)
        try container.encode(name, forKey: .name)
        try container.encode(teamIdentifier, forKey: .teamIdentifier)
    }
}

//correctTypedParameter = QuantumValue(QuantumValue(["BundleIdentifier": QuantumValue(matchedParameter), "Name": QuantumValue(matchedParameter), "TeamIdentifier": "0000000000"]))
