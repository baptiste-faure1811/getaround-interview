//
//  Array+Ext.swift
//  GetAround
//
//  Created by Baptiste Faure on 13/06/2024.
//

import Foundation

// This extensions allows storing arrays of Codable elements in Userdefaults using the @AppStorage property wrapper.
// Copied from: https://danielsaidi.com/blog/2023/08/23/storagecodable
extension Array: RawRepresentable where Element: Codable & Equatable {
    public init?(rawValue: String) {
        guard
            let data = rawValue.data(using: .utf8),
            let result = try? JSONDecoder().decode([Element].self, from: data)
        else { return nil }
        self = result
    }

    public var rawValue: String {
        guard
            let data = try? JSONEncoder().encode(self),
            let result = String(data: data, encoding: .utf8)
        else { return "" }
        return result
    }

    public mutating func toggle(element: Element) {
        if let index = firstIndex(of: element) {
            remove(at: index)
        } else {
            append(element)
        }
    }
}
