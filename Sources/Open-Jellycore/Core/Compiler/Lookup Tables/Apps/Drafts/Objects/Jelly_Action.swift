//
//  Jelly_Action.swift
//  
//
//  Created by Zachary Lineman on 1/5/23.
//

struct Jelly_Action: JellyObject, Codable {
    @CodableIgnored
    var objectName: String = "Action"
    @CodableIgnored
    var correctType: String = "Action"
    @CodableIgnored
    var description: String = "An object that represents an Action from the drafts app"
    
    var identifier: JellyString?
    var displayString: JellyString?
    var name: JellyString?

    init(_ value: CoreNode, scopedVariables: [Variable]) {
//        if let parameter = node as? ObjectNode {
//            if parameter.objectName != correctType {
//                ErrorReporter.shared.report(error: .typeError(type: objectName, description: "\(parameter.objectName) is not equivalent to the expected type \(objectName)"), textPosition: parameter.textPosition)
//                return
//            }
//
//            if let value = parameter.parameters.first(where: { node in return node.slotName == "identifier" }) {
//                self.identifier = JellyString(value, scopedVariables: scopedVariables)
//            } else {
//                ErrorReporter.shared.report(error: .parameterNotFound(parameter: "identifier", functionName: "ActionGroup"), textPosition: node.textPosition)
//            }
//            if let value = parameter.parameters.first(where: { node in return node.slotName == "displayString" }) {
//                self.displayString = JellyString(value, scopedVariables: scopedVariables)
//            } else {
//                ErrorReporter.shared.report(error: .parameterNotFound(parameter: "displayString", functionName: "ActionGroup"), textPosition: node.textPosition)
//            }
//            if let value = parameter.parameters.first(where: { node in return node.slotName == "name" }) {
//                self.name = JellyString(value, scopedVariables: scopedVariables)
//            } else {
//                ErrorReporter.shared.report(error: .parameterNotFound(parameter: "name", functionName: "ActionGroup"), textPosition: node.textPosition)
//            }
//        }
    }
}
