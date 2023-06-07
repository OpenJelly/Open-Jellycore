//
//  GetAudioPlaybackDestinationParameter.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

struct GetAudioPlaybackDestinationParameter: ParameterProtocol, Codable {


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        return GetAudioPlaybackDestinationParameter()
    }
     
    // Need to loop through all properties to build the documentation.
    static func getDefaultValues() -> [String: String] {
        return [
:
        ]
    }
}
