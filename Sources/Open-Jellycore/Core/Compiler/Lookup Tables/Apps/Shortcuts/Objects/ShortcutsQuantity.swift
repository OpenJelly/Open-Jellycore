//
//  ShortcutsQuantity.swift
//  JellycoreV2
//
//  Created by Taylor Lineman on 1/2/23.
//

struct ShortcutsQuantity: JellyAny, Codable {
    var value: String
    
    init(_ value: CoreNode, scopedVariables: [Variable]) {
        self.value = value.content
    }
    
    //Parse a time interval. This is used in a couple of the type parsing
    internal func getTimeInterval(input: String) -> [String: QuantumValue] {
        let intervalCallSplit = input.split(separator: " ")
        
        if intervalCallSplit.count < 2 {
            ErrorReporter.shared.reportError(error: .syntax(description: "Quantity value not correctly formatted.", recoveryStrategy: "Make sure the interval has both a quantity and a value"), node: nil)
            return [:]
        }
        
        let quantity: Double = Double(intervalCallSplit[0]) ?? 0
        var unit = String(intervalCallSplit[1])
        
        if unit.contains("hour") || unit.contains("hr") {
            unit = "hr"
        } else if unit.contains("min") {
            unit = "min"
        } else if unit.contains("sec") {
            unit = "sec"
        } else {
            switch input.lowercased() {
            case "years":
                unit = "4"
            case "months":
                unit = "8"
            case "weeks":
                unit = "8192"
            case "days":
                unit = "16"
            case "hours":
                unit = "32"
            case "minutes":
                unit = "64"
            case "seconds":
                unit = "128"
            default:
                unit = "4"
            }
        }
        
        return [
            "WFSerializationType": QuantumValue("WFQuantityFieldValue"),
            "Value": QuantumValue([
                "Magnitude": QuantumValue(quantity),
                "Unit": QuantumValue(unit)
            ])
        ]
    }
    
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()

        try container.encode(getTimeInterval(input: value))
    }
    
    static func getDescription() -> String {
        return "A quantity used by many shortcuts actions. Quantities are formatted with a number followed by a quantity type. Quantity types are any of the following, hours, hour, hrs, hr, minutes, mins, min, seconds, sec, days, day, years, year, weeks, week, kcal"
    }
    
    static func getName() -> String {
        return "Time Interval"
    }
}
