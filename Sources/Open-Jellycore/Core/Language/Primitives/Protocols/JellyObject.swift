//
//  JellyObject.swift
//  
//
//  Created by Taylor Lineman on 1/6/23.
//

protocol JellyObject: JellyAny, Codable {
    
    init?(_ value: CoreNode)
    
    var objectName: String { get }
    var correctType: String { get }
    var description: String { get }
}

