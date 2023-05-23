//
//  Encodable+asDictionary.swift
//  Jellycore
//
//  Created by Taylor Lineman on 10/28/22.
//

import Foundation

extension Encodable {
    func asDictionary() -> [String: QuantumValue] {
        do {
            let data = try JSONEncoder().encode(self)
            
            guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
                print("Unable to encode")
                return [:]
            }
            
            var quantumDictionary: [String: QuantumValue] = [:]
            for item in dictionary {
                quantumDictionary.merge([item.key: QuantumValue(item.value)]) { first, _ in return first }
            }
            
            return quantumDictionary
        } catch {
            print(self)
            print(error)
            return [:]
        }
    }
}
