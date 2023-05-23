//
//  Action.swift
//  
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
    
    func build(call: FunctionCallNode, magicVariable: Variable?, scopedVariables: [Variable]) -> WFAction
}

struct Action<ParameterType: ParameterProtocol>: AnyAction {
    var name: String
    var identifier: String
    var correctTypedFunction: String
    var description: String
    var lowestCompatibleHost: ShortcutsHostVersion
    var presets: [ActionPreset]
    
    func build(call: FunctionCallNode, magicVariable: Variable?, scopedVariables: [Variable]) -> WFAction {
        var callParameters = call.parameters
        
        if callParameters.contains(where: {$0.slotName == nil}) {
            // TODO: ERROR HANDLING
            // Empty slot names are no longer supported
        }
        
        let type: ParameterType = ParameterType.build(call: callParameters, scopedVariables: []) as! ParameterType
        let parameters: [String: QuantumValue] = type.asDictionary()

        return WFAction(WFWorkflowActionIdentifier: identifier, WFWorkflowActionParameters: parameters)
        
    }
}
