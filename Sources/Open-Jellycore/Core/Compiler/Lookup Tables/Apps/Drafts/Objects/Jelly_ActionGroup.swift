//
//  Jelly_ActionGroup.swift
//  
//
//  Created by Zachary Lineman on 1/5/23.
//

struct Jelly_ActionGroup: JellyObject, Codable {
    @CodableIgnored
    var objectName: String = "Action Group"
    @CodableIgnored
    var correctType: String = "ActionGroup"
    @CodableIgnored
    var description: String = "An object that represents an Action Group from the Drafts app.."
    
    var identifier: JellyString?
    var displayString: JellyString?
    var name: JellyString?

    init(_ value: CoreNode, scopedVariables: [Variable]) {
//        if let parameter = node as? ObjectNode {
//            if parameter.objectName != correctType {
//                EventReporter.shared.report(error: .typeError(type: objectName, description: "\(parameter.objectName) is not equivalent to the expected type \(objectName)"), textPosition: parameter.textPosition)
//                return
//            }
//
//            if let value = parameter.parameters.first(where: { node in return node.slotName == "identifier" }) {
//                self.identifier = JellyString(value, scopedVariables: scopedVariables)
//            } else {
//                EventReporter.shared.report(error: .parameterNotFound(parameter: "identifier", functionName: "ActionGroup"), textPosition: node.textPosition)
//            }
//            if let value = parameter.parameters.first(where: { node in return node.slotName == "displayString" }) {
//                self.displayString = JellyString(value, scopedVariables: scopedVariables)
//            } else {
//                EventReporter.shared.report(error: .parameterNotFound(parameter: "displayString", functionName: "ActionGroup"), textPosition: node.textPosition)
//            }
//            if let value = parameter.parameters.first(where: { node in return node.slotName == "name" }) {
//                self.name = JellyString(value, scopedVariables: scopedVariables)
//            } else {
//                EventReporter.shared.report(error: .parameterNotFound(parameter: "name", functionName: "ActionGroup"), textPosition: node.textPosition)
//            }
//        }
    }
}
