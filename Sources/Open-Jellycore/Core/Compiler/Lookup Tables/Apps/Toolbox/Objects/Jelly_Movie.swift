//
//  Jelly_Movie.swift
//  
//
//  Created by Zachary Lineman on 1/5/23.
//

struct Jelly_Movie: JellyObject, Codable {
    @CodableIgnored
    var objectName: String = "Toolbox Pro Movie"
    @CodableIgnored
    var correctType: String = "Movie"
    @CodableIgnored
    var description: String = "A movie from the Toolbox Pro app."
    
    
    var identifier: JellyString?
    var displayString: JellyString?
    var tmd_id: JellyInteger?
    var title: JellyString?
    var posterThumbURL: JellyString?
    var voteAverage: JellyDouble?
    var voteCount: JellyInteger?
    var releaseDate: JellyDate?
    var popularity: JellyDouble?
    var overview: JellyString?
    var genres: JellyString?
    
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
//                EventReporter.shared.report(error: .parameterNotFound(parameter: "identifier", functionName: "Movie"), textPosition: node.textPosition)
//            }
//            if let value = parameter.parameters.first(where: { node in return node.slotName == "displayString" }) {
//                self.displayString = JellyString(value, scopedVariables: scopedVariables)
//            } else {
//                EventReporter.shared.report(error: .parameterNotFound(parameter: "displayString", functionName: "Movie"), textPosition: node.textPosition)
//            }
//            if let value = parameter.parameters.first(where: { node in return node.slotName == "tmd_id" }) {
//                self.tmd_id = JellyInteger(value, scopedVariables: scopedVariables)
//            } else {
//                EventReporter.shared.report(error: .parameterNotFound(parameter: "tmd_id", functionName: "Movie"), textPosition: node.textPosition)
//            }
//            if let value = parameter.parameters.first(where: { node in return node.slotName == "title" }) {
//                self.title = JellyString(value, scopedVariables: scopedVariables)
//            } else {
//                EventReporter.shared.report(error: .parameterNotFound(parameter: "title", functionName: "Movie"), textPosition: node.textPosition)
//            }
//            if let value = parameter.parameters.first(where: { node in return node.slotName == "posterThumbURL" }) {
//                self.posterThumbURL = JellyString(value, scopedVariables: scopedVariables)
//            } else {
//                EventReporter.shared.report(error: .parameterNotFound(parameter: "posterThumbURL", functionName: "Movie"), textPosition: node.textPosition)
//            }
//            if let value = parameter.parameters.first(where: { node in return node.slotName == "voteAverage" }) {
//                self.voteAverage = JellyDouble(value, scopedVariables: scopedVariables)
//            } else {
//                EventReporter.shared.report(error: .parameterNotFound(parameter: "voteAverage", functionName: "Movie"), textPosition: node.textPosition)
//            }
//            if let value = parameter.parameters.first(where: { node in return node.slotName == "releaseDate" }) {
//                self.releaseDate = JellyDate(value, scopedVariables: scopedVariables)
//            } else {
//                EventReporter.shared.report(error: .parameterNotFound(parameter: "releaseDate", functionName: "Movie"), textPosition: node.textPosition)
//            }
//            if let value = parameter.parameters.first(where: { node in return node.slotName == "popularity" }) {
//                self.popularity = JellyDouble(value, scopedVariables: scopedVariables)
//            } else {
//                EventReporter.shared.report(error: .parameterNotFound(parameter: "popularity", functionName: "Movie"), textPosition: node.textPosition)
//            }
//            if let value = parameter.parameters.first(where: { node in return node.slotName == "overview" }) {
//                self.overview = JellyString(value, scopedVariables: scopedVariables)
//            } else {
//                EventReporter.shared.report(error: .parameterNotFound(parameter: "overview", functionName: "Movie"), textPosition: node.textPosition)
//            }
//            if let value = parameter.parameters.first(where: { node in return node.slotName == "genres" }) {
//                self.genres = JellyString(value, scopedVariables: scopedVariables)
//            } else {
//                EventReporter.shared.report(error: .parameterNotFound(parameter: "genres", functionName: "Movie"), textPosition: node.textPosition)
//            }
//        }
    }
}
