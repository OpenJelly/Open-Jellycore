//
//  Jelly_Item.swift
//  
//
//  Created by Zachary Lineman on 1/5/23.
//

struct Jelly_Item: JellyObject, Codable {
    @CodableIgnored
    var objectName: String = "Progress Item"
    @CodableIgnored
    var correctType: String = "Item"
    @CodableIgnored
    var description: String = "A Recurrence Item"
    
    
    
    var identifier: JellyString?
    var displayString: JellyString?

    init(_ node: CoreNode, scopedVariables: [Variable]) {
//        if let parameter = node as? ObjectNode {
//            if parameter.objectName != correctType {
//                EventReporter.shared.report(error: .typeError(type: objectName, description: "\(parameter.objectName) is not equivalent to the expected type \(objectName)"), textPosition: parameter.textPosition)
//                return
//            }
//
//            if let value = parameter.parameters.first(where: { node in return node.slotName == "identifier" }) {
//                self.identifier = JellyString(value, scopedVariables: scopedVariables)
//            } else {
//                EventReporter.shared.report(error: .parameterNotFound(parameter: "identifier", functionName: "Jelly_Item"), textPosition: node.textPosition)
//            }
//            if let value = parameter.parameters.first(where: { node in return node.slotName == "displayString" }) {
//                self.displayString = JellyString(value, scopedVariables: scopedVariables)
//            } else {
//                EventReporter.shared.report(error: .parameterNotFound(parameter: "displayString", functionName: "Jelly_Item"), textPosition: node.textPosition)
//            }
//
//        }
    }
}
