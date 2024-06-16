//
//  Car.swift
//  GetAround
//
//  Created by Baptiste Faure on 13/06/2024.
//

import Foundation

// Equatable is required for some SwiftUI animations.
// Identifiable is required for SwiftUI ForEach.
// Codable is required to convert the JSON return by the GET request.
// Hashable is required for NavigationStack path Destination
struct Car: Codable, Identifiable, Equatable, Hashable {
    public let id: String

    public let brand: String
    public let model: String
    public let price_per_day: Double

    private let picture_url: String
    public var picture: URL? {
        return URL(string: picture_url)
    }

    public let rating: Rating
    public let owner: Owner

    public var name: String {
        return [brand, model].joined(separator: ", ")
    }
}

struct Owner: Codable, Equatable, Hashable {
    public let name: String
    public let rating: Rating

    private let picture_url: String
    public var picture: URL? {
        return URL(string: picture_url)
    }
}

struct Rating: Codable, Equatable, Hashable {
    public let average: Double
    public let count: Int
}
