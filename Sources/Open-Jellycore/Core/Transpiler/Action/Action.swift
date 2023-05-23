//
//  Action.swift
//  JellycoreV2
//
//  Created by Taylor Lineman on 10/28/22.
//

protocol AnyAction {
    var name: String { get }
    var identifier: String { get }
    var correctTypedFunction: String { get }
    var description: String { get }
    var lowestCompatibleHost: ShortcutsHostVersion { get }
    var presets: [ActionPreset] { get }
    
    func build(call: [FunctionCallParameterItem], magicVariable: Variable?, scopedVariables: [Variable]) -> WFAction
}

struct Action<ParameterType: ParameterProtocol>: AnyAction {
    var name: String
    var identifier: String
    var correctTypedFunction: String
    var description: String
    var lowestCompatibleHost: ShortcutsHostVersion
    var presets: [ActionPreset]
    
    func build(call: [FunctionCallParameterItem], magicVariable: Variable?, scopedVariables: [Variable]) -> WFAction {
        for parameter in call {
            if parameter.slotName == nil {
                // TODO: Get the proper slot names
                ErrorHandler.shared.reportError(error: .missingParameterName(function: name, name: "PLACEHOLDER"), node: parameter)
            }
        }
                
        let type: ParameterType = ParameterType.build(call: call, scopedVariables: []) as! ParameterType
        let parameters: [String: QuantumValue] = type.asDictionary()

        return WFAction(WFWorkflowActionIdentifier: identifier, WFWorkflowActionParameters: parameters)
        
    }
}
