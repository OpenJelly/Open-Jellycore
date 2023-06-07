//
//  Jelly_Draft.swift
//  
//
//  Created by Zachary Lineman on 1/5/23.
//

struct Jelly_Draft: JellyObject, Codable {
    @CodableIgnored
    var objectName: String = "Draft"
    @CodableIgnored
    var correctType: String = "Draft"
    @CodableIgnored
    var description: String = "An object that represents a Draft from the Drafts app."
    
    var identifier: JellyString?
    var displayString: JellyString?
    var uuid: JellyString?
    var link: JellyString?
    var content: JellyString?
    var title: JellyString?
    var tags: JellyArray<JellyString>?
    var folder: JellyString?
    var isFlagged: JellyBoolean?
    var grammarType: Jelly_GrammarType?

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
//                ErrorReporter.shared.report(error: .parameterNotFound(parameter: "identifier", functionName: "Draft"), textPosition: node.textPosition)
//            }
//            if let value = parameter.parameters.first(where: { node in return node.slotName == "displayString" }) {
//                self.displayString = JellyString(value, scopedVariables: scopedVariables)
//            } else {
//                ErrorReporter.shared.report(error: .parameterNotFound(parameter: "displayString", functionName: "Draft"), textPosition: node.textPosition)
//            }
//            if let value = parameter.parameters.first(where: { node in return node.slotName == "uuid" }) {
//                self.uuid = JellyString(value, scopedVariables: scopedVariables)
//            } else {
//                ErrorReporter.shared.report(error: .parameterNotFound(parameter: "uuid", functionName: "Draft"), textPosition: node.textPosition)
//            }
//            if let value = parameter.parameters.first(where: { node in return node.slotName == "link" }) {
//                self.link = JellyString(value, scopedVariables: scopedVariables)
//            } else {
//                ErrorReporter.shared.report(error: .parameterNotFound(parameter: "link", functionName: "Draft"), textPosition: node.textPosition)
//            }
//            if let value = parameter.parameters.first(where: { node in return node.slotName == "content" }) {
//                self.content = JellyString(value, scopedVariables: scopedVariables)
//            } else {
//                ErrorReporter.shared.report(error: .parameterNotFound(parameter: "content", functionName: "Draft"), textPosition: node.textPosition)
//            }
//            if let value = parameter.parameters.first(where: { node in return node.slotName == "title" }) {
//                self.title = JellyString(value, scopedVariables: scopedVariables)
//            } else {
//                ErrorReporter.shared.report(error: .parameterNotFound(parameter: "title", functionName: "Draft"), textPosition: node.textPosition)
//            }
//            if let value = parameter.parameters.first(where: { node in return node.slotName == "tags" }) {
//                self.tags = JellyArray<JellyString>(value, scopedVariables: scopedVariables)
//            } else {
//                ErrorReporter.shared.report(error: .parameterNotFound(parameter: "tags", functionName: "Draft"), textPosition: node.textPosition)
//            }
//            if let value = parameter.parameters.first(where: { node in return node.slotName == "grammarType" }) {
//                self.grammarType = Jelly_GrammarType(value, scopedVariables: scopedVariables)
//            } else {
//                ErrorReporter.shared.report(error: .parameterNotFound(parameter: "grammarType", functionName: "Draft"), textPosition: node.textPosition)
//            }
//
//        }
    }
}
