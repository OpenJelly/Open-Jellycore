//
//  Action.swift
//  JellycoreV2
//
//  Created by Taylor Lineman on 10/28/22.
//

/// A protocol that allows for Actions to be generalized and stored in arrays where every action has a different ParameterType specialization.
protocol AnyAction {
    /// The name of the action that is named for the user to read.
    var name: String { get }
    /// The  identifier for the action that shortcuts uses to identify where an action came from.
    var identifier: String { get }
    /// The correctly typed function name. This is the name that the user types in actual Jelly code and is recognized when compiling function calls.
    var correctTypedFunction: String { get }
    /// The description of the function explaining it's use. This is shown in mainly in documentation for the function.
    var description: String { get }
    /// The lowest compatible shortcuts host version that this action supports.
    var lowestCompatibleHost: ShortcutsHostVersion { get }
    /// Any preset parameter values that an action may have. These are used sparingly by shortcuts for odd default values that are needed for an action to function.
    var presets: [ActionPreset] { get }
    
    /// Builds a shortcut WFAction based on the Actions values. Uses the `ParameterProtocol`s `build` function to construct the internal parameter values based on the generalization of Action `ParameterType`
    /// - Parameters:
    ///   - call: The list of `FunctionCallParameterItem`s that was used when the function was called by the user.
    ///   - magicVariable: A magic variable that this action should insert into it's `WFAction` parameters.
    ///   - scopedVariables: The variables that this action has access too.
    /// - Returns: A  `WFAction` that represents the given Action and will encode to a shortcuts compatible action.
    func build(call: [FunctionCallParameterItem], magicVariable: Variable?, scopedVariables: [Variable]) -> WFAction
    
    /// Returns the default parameters for all of the parameters in an action. Used mainly in documentation.
    /// - Returns: The default parameters keyed by the parameter / slot name.
    func getDefaultParameters() -> [String: String]
}

struct Action<ParameterType: ParameterProtocol>: AnyAction {
    /// The name of the action that is named for the user to read.
    var name: String
    /// The  identifier for the action that shortcuts uses to identify where an action came from.
    var identifier: String
    /// The correctly typed function name. This is the name that the user types in actual Jelly code and is recognized when compiling function calls.
    var correctTypedFunction: String
    /// The description of the function explaining it's use. This is shown in mainly in documentation for the function.
    var description: String
    /// The lowest compatible shortcuts host version that this action supports.
    var lowestCompatibleHost: ShortcutsHostVersion
    /// Any preset parameter values that an action may have. These are used sparingly by shortcuts for odd default values that are needed for an action to function.
    var presets: [ActionPreset]
    
    /// Builds a shortcut WFAction based on the Actions values. Uses the `ParameterProtocol`s `build` function to construct the internal parameter values based on the generalization of Action `ParameterType`
    /// - Parameters:
    ///   - call: The list of `FunctionCallParameterItem`s that was used when the function was called by the user.
    ///   - magicVariable: A magic variable that this action should insert into it's `WFAction` parameters.
    ///   - scopedVariables: The variables that this action has access too.
    /// - Returns: A  `WFAction` that represents the given Action and will encode to a shortcuts compatible action.
    func build(call: [FunctionCallParameterItem], magicVariable: Variable?, scopedVariables: [Variable]) -> WFAction {
        for parameter in call {
            if parameter.slotName == nil {
                // TODO: Get the proper slot names
                ErrorReporter.shared.reportError(error: .missingParameterName(function: name, name: "PLACEHOLDER"), node: parameter)
            }
        }
                
        /// This is where  `ParameterProtocol`s static build function comes into play. We used it to construct a type of the given parameter protocol.
        let type: ParameterType = ParameterType.build(call: call, scopedVariables: scopedVariables) as! ParameterType
        var parameters: [String: QuantumValue] = type.asDictionary()

        if let magicVariable = magicVariable {
            parameters.merge(["UUID": QuantumValue(magicVariable.uuid), "CustomOutputName": QuantumValue(magicVariable.name)]) { first, _ in
                return first
            }
        }
        
        return WFAction(WFWorkflowActionIdentifier: identifier, WFWorkflowActionParameters: parameters)
    }
    
    /// Returns the default parameters for all of the parameters in an action. Used mainly in documentation.
    /// - Returns: The default parameters keyed by the parameter / slot name.
    func getDefaultParameters() -> [String: String] {
        return ParameterType.getDefaultValues()
    }
}
