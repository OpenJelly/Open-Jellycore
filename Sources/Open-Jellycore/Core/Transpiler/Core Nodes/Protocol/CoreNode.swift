//
//  CoreNode.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 5/21/23.
//

import Foundation

protocol CoreNode {
    var type: CoreNodeType { get }
    var sString: String { get }
    var content: String { get }
    
    var rawValue: TreeSitterNode { get }
}
