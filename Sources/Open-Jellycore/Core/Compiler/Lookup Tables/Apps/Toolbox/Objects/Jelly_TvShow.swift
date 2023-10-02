//
//  Jelly_TvShow.swift
//  
//
//  Created by Zachary Lineman on 1/5/23.
//

struct Jelly_TvShow: JellyObject, Codable {
    @CodableIgnored
    var objectName: String = "Toolbox Pro Tv Show"
    @CodableIgnored
    var correctType: String = "TVShow"
    @CodableIgnored
    var description: String = "A TVShow from the Toolbox Pro app."
    
    var identifier: JellyString?
    var displayString: JellyString?
    var title: JellyString?
    var overview: JellyString?
    var voteCount: JellyInteger?
    var voteAverage: JellyDouble?
    var tmd_id: JellyInteger?
    var popularity: JellyDouble?
    var posterThumbURL: JellyString?
    var genres: JellyString?
    var firstAirDate: JellyDate?
    var postURL: JellyString?
    
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
//                EventReporter.shared.report(error: .parameterNotFound(parameter: "identifier", functionName: "TvShow"), textPosition: node.textPosition)
//            }
//            if let value = parameter.parameters.first(where: { node in return node.slotName == "displayString" }) {
//                self.displayString = JellyString(value, scopedVariables: scopedVariables)
//            } else {
//                EventReporter.shared.report(error: .parameterNotFound(parameter: "displayString", functionName: "TvShow"), textPosition: node.textPosition)
//            }
//            if let value = parameter.parameters.first(where: { node in return node.slotName == "tmd_id" }) {
//                self.tmd_id = JellyInteger(value, scopedVariables: scopedVariables)
//            } else {
//                EventReporter.shared.report(error: .parameterNotFound(parameter: "tmd_id", functionName: "TvShow"), textPosition: node.textPosition)
//            }
//            if let value = parameter.parameters.first(where: { node in return node.slotName == "title" }) {
//                self.title = JellyString(value, scopedVariables: scopedVariables)
//            } else {
//                EventReporter.shared.report(error: .parameterNotFound(parameter: "title", functionName: "TvShow"), textPosition: node.textPosition)
//            }
//            if let value = parameter.parameters.first(where: { node in return node.slotName == "posterThumbURL" }) {
//                self.posterThumbURL = JellyString(value, scopedVariables: scopedVariables)
//            } else {
//                EventReporter.shared.report(error: .parameterNotFound(parameter: "posterThumbURL", functionName: "TvShow"), textPosition: node.textPosition)
//            }
//            if let value = parameter.parameters.first(where: { node in return node.slotName == "voteAverage" }) {
//                self.voteAverage = JellyDouble(value, scopedVariables: scopedVariables)
//            } else {
//                EventReporter.shared.report(error: .parameterNotFound(parameter: "voteAverage", functionName: "TvShow"), textPosition: node.textPosition)
//            }
//            if let value = parameter.parameters.first(where: { node in return node.slotName == "firstAirDate" }) {
//                self.firstAirDate = JellyDate(value, scopedVariables: scopedVariables)
//            } else {
//                EventReporter.shared.report(error: .parameterNotFound(parameter: "firstAirDate", functionName: "TvShow"), textPosition: node.textPosition)
//            }
//            if let value = parameter.parameters.first(where: { node in return node.slotName == "popularity" }) {
//                self.popularity = JellyDouble(value, scopedVariables: scopedVariables)
//            } else {
//                EventReporter.shared.report(error: .parameterNotFound(parameter: "popularity", functionName: "TvShow"), textPosition: node.textPosition)
//            }
//            if let value = parameter.parameters.first(where: { node in return node.slotName == "overview" }) {
//                self.overview = JellyString(value, scopedVariables: scopedVariables)
//            } else {
//                EventReporter.shared.report(error: .parameterNotFound(parameter: "overview", functionName: "TvShow"), textPosition: node.textPosition)
//            }
//            if let value = parameter.parameters.first(where: { node in return node.slotName == "genres" }) {
//                self.genres = JellyString(value, scopedVariables: scopedVariables)
//            } else {
//                EventReporter.shared.report(error: .parameterNotFound(parameter: "genres", functionName: "TvShow"), textPosition: node.textPosition)
//            }
//            if let value = parameter.parameters.first(where: { node in return node.slotName == "postURL" }) {
//                self.postURL = JellyString(value, scopedVariables: scopedVariables)
//            } else {
//                EventReporter.shared.report(error: .parameterNotFound(parameter: "postURL", functionName: "TvShow"), textPosition: node.textPosition)
//            }
//        }
    }
}
