//
//  ShortcutColor.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 1/7/23.
//

public enum ShortcutColor: String, CaseIterable, Identifiable {
    case red
    case orange
    case tangerine
    case yellow
    case green
    case teal
    case lightBlue
    case blue
    case navy
    case grape
    case purple
    case pink
    case grayBlue
    case grayGreen
    case grayBrown
    
    public var version: ShortcutsHostVersion {
        switch self {
        case .red:
            return .iOS13
        case .orange:
            return .iOS13
        case .tangerine:
            return .iOS13
        case .yellow:
            return .iOS13
        case .green:
            return .iOS13
        case .teal:
            return .iOS13
        case .lightBlue:
            return .iOS13
        case .blue:
            return .iOS13
        case .navy:
            return .iOS13
        case .grape:
            return .iOS13
        case .purple:
            return .iOS13
        case .pink:
            return .iOS13
        case .grayBlue:
            return .iOS13
        case .grayGreen:
            return .iOS13
        case .grayBrown:
            return .iOS13
        }
    }
    
    public var id: Int {
        switch self {
        case .red:
            return 4282601983
        case .orange:
            return 4251333119
        case .tangerine:
            return 4271458815
        case .yellow:
            return 4274264319
        case .green:
            return 4292093695
        case .teal:
            return 431817727
        case .lightBlue:
            return 1440408063
        case .blue:
            return 463140863
        case .navy:
            return 946986751
        case .grape:
            return 2071128575
        case .purple:
            return 3679049983
        case .pink:
            return 3980825855
        case .grayBlue:
            return 255
        case .grayGreen:
            return 3031607807
        case .grayBrown:
            return 2846468607
        }
    }
    
    public var gradient: (top: String, bottom: String) {
        switch self {
        case .red:
            return ("#F36F74", "#F2585E")
        case .orange:
            return ("#FF8E73", "#FF7C5C")
        case .tangerine:
            return ("#F8AE5F", "#F7A145")
        case .yellow:
            return ("#E8CA45", "#E5C238")
        case .green:
            return ("#53CD6B", "#37C553")
        case .teal:
            return ("#57CFB4", "#2AC7A8")
        case .lightBlue:
            return ("#5ACCDE", "#3FC4D9")
        case .blue:
            return ("#24BAF7", "#00AFF6")
        case .navy:
            return ("#5874CA", "#3D5EC2")
        case .grape:
            return ("#9164C7", "#7F4BBE")
        case .purple:
            return ("#C085E6", "#B671E2")
        case .pink:
            return ("#F694D8", "#F583D2")
        case .grayBlue:
            return ("9099A3", "#7E8994")
        case .grayGreen:
            return ("#9DA79D", "#8D998E")
        case .grayBrown:
            return ("#A49995", "#968984")
        }
    }
}
