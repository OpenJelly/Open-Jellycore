//
//  JellyEnum.swift
//  
//
//  Created by Taylor Lineman on 11/7/22.
//

protocol JellyEnum: JellyAny, Codable {
        
    init?(_ value: CoreNode, scopedVariables: [Variable])

    var value: String { get }
}
