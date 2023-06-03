//
//  CodableIgnored.swift
//  JellycoreV2
//
//  Created by Taylor Lineman on 6/2/23.


@propertyWrapper
struct CodableIgnored<T>: Codable {
    public var wrappedValue: T
        
    public init(wrappedValue: T) {
        self.wrappedValue = wrappedValue
    }
    
    public init(from decoder: Decoder) throws {
        self.wrappedValue = T.self as! T
    }
    
    public func encode(to encoder: Encoder) throws {
        // Do nothing
    }
}

extension KeyedDecodingContainer {
    func decode<T>(
        _ type: CodableIgnored<T>.Type,
        forKey key: Self.Key) throws -> CodableIgnored<T>
    {
        return CodableIgnored(wrappedValue: T.self as! T)
    }
}

extension KeyedEncodingContainer {
    mutating func encode<T>(
        _ value: CodableIgnored<T>,
        forKey key: KeyedEncodingContainer<K>.Key) throws
    {
        // Do nothing
    }
}
