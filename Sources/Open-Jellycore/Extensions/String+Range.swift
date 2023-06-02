//
//  String+Range.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/1/23.
//

import Foundation

extension String {
    var range: NSRange {
        let fromIndex = unicodeScalars.index(unicodeScalars.startIndex, offsetBy: 0)
        let toIndex = unicodeScalars.index(fromIndex, offsetBy: count)
        return NSRange(fromIndex..<toIndex, in: self)
    }
}
