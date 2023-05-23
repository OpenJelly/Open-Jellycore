//
//  ParameterProtocol.swift
//  JellycoreV2
//
//  Created by Taylor Lineman on 11/4/22.
//

protocol ParameterProtocol: Codable {
    static func build(call: [FunctionCallParameterItem], scopedVariables: [Variable]) -> ParameterProtocol
    static func getDefaultValues() -> [String: String]
}
