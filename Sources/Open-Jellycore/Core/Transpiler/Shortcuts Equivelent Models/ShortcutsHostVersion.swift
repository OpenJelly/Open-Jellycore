//
//  ShortcutsHostVersion.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 10/20/22.
//

/// Represents the host versions that shortcuts supported
public enum ShortcutsHostVersion: Int, Encodable, CaseIterable {
    case iOS13
    case iOS14
    case iOS15
    case iOS16
    case macOS12
    
    /// The custom version number. Used for detecting if versions are less than one or the other.
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
    
    /// The name of the version used for display.
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
