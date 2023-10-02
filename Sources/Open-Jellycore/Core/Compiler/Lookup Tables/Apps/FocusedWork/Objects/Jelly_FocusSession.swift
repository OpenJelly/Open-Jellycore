//
//  Jelly_FocusSession.swift
//  
//
//  Created by Zachary Lineman on 1/5/23.
//

struct Jelly_FocusSession: JellyObject, Codable {
    @CodableIgnored
    var objectName: String = "Focus Session"
    @CodableIgnored
    var correctType: String = "FocusSession"
    @CodableIgnored
    var description: String = "One of your Focus Sessions"
    
    var identifier: JellyString?
    var displayString: JellyString?
    var name: JellyString?
    var emojiIcon: JellyString?
    var id: JellyString?
    
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
//                EventReporter.shared.report(error: .parameterNotFound(parameter: "identifier", functionName: "FocusSession"), textPosition: node.textPosition)
//            }
//            if let value = parameter.parameters.first(where: { node in return node.slotName == "displayString" }) {
//                self.displayString = JellyString(value, scopedVariables: scopedVariables)
//            } else {
//                EventReporter.shared.report(error: .parameterNotFound(parameter: "displayString", functionName: "FocusSession"), textPosition: node.textPosition)
//            }
//            if let value = parameter.parameters.first(where: { node in return node.slotName == "name" }) {
//                self.name = JellyString(value, scopedVariables: scopedVariables)
//            } else {
//                EventReporter.shared.report(error: .parameterNotFound(parameter: "name", functionName: "FocusSession"), textPosition: node.textPosition)
//            }
//            if let value = parameter.parameters.first(where: { node in return node.slotName == "emojiIcon" }) {
//                self.emojiIcon = JellyString(value, scopedVariables: scopedVariables)
//            } else {
//                EventReporter.shared.report(error: .parameterNotFound(parameter: "name", functionName: "emojiIcon"), textPosition: node.textPosition)
//            }
//            if let value = parameter.parameters.first(where: { node in return node.slotName == "id" }) {
//                self.id = JellyString(value, scopedVariables: scopedVariables)
//            } else {
//                EventReporter.shared.report(error: .parameterNotFound(parameter: "name", functionName: "id"), textPosition: node.textPosition)
//            }
//        }
    }
}
