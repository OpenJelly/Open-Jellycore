//
//  GetCurrentFocusParameter.swift
//  Open-Jellycore
//
//  Created by Albion Fung on 5 Dec 2023.
//

struct GetCurrentFocusParameter: ParameterProtocol, Codable {


    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol {
        return GetCurrentFocusParameter()
    }
     
    static func getDefaultValues() -> [String: String] {
        return [
:
        ]
    }
}
