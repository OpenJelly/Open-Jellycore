//
//  ShortcutsHostVersion.swift
//  
//
//  Created by Taylor Lineman on 10/20/22.
//

// MARK: Shortcuts host versions
public enum ShortcutsHostVersion: Int, Encodable, CaseIterable {
    case iOS13
    case iOS14
    case iOS15
    case iOS16
    case macOS12
    
    public var version: Int {
        switch self {
        case .iOS13:
            return 0
        case .iOS14:
            return 1
        case .iOS15:
            return 2
        case .iOS16:
            return 3
        case .macOS12:
            return 3
        }
    }
    
    public var name: String {
        switch self {
        case .iOS13:
            return "iOS 13"
        case .iOS14:
            return "iOS 14"
        case .iOS15:
            return "iOS 15"
        case .iOS16:
            return "iOS 16"
        case .macOS12:
            return "macOS12"
        }
    }
}
