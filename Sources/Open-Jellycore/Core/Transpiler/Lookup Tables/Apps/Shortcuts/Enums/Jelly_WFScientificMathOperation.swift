//
//  Jelly_WFScientificMathOperation.swift
//  Open-Jellycore
//
//  Created by Taylor Lineman on 6/02/23.
//

enum Jelly_WFScientificMathOperation: String, JellyEnum, Codable {
    case Modulus
    case x_two
    case x_three
    case x_y
    case e_x
    case ten_x
    case lnx
    case logx
    case sqrx
    case cubertx
    case x
    case sinx
    case cosx
    case tanx
    case absx


    init?(_ value: CoreNode, scopedVariables: [Variable]) {
        self.init(rawValue: value.content)
    }
    
    var value: String {
        switch self {
        case .Modulus:
            return "Modulus"
        case .x_two:
            return "x^2"
        case .x_three:
            return "x^3"
        case .x_y:
            return "x^y"
        case .e_x:
            return "e^x"
        case .ten_x:
            return "10^x"
        case .lnx:
            return "ln(x)"
        case .logx:
            return "log(x)"
        case .sqrx:
            return "√x"
        case .cubertx:
            return "∛x"
        case .x:
            return "x!"
        case .sinx:
            return "sin(x)"
        case .cosx:
            return "cos(x)"
        case .tanx:
            return "tan(x)"
        case .absx:
            return "abs(x)"

        }
    }
}

extension Jelly_WFScientificMathOperation {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(value)
    }
}
