//
//  Errors.swift
//  GetAround
//
//  Created by Baptiste Faure on 13/06/2024.
//

import Foundation

enum FetchErrors: LocalizedError {
    case noInternet
    case parsingFailed
    case serverError
    case clientError
    case malformedURL
    case unknown(error: Error)

    var errorDescription: String? {
        switch self {
        case .noInternet:
            return "No internet connection."
        case .parsingFailed:
            return "Failed to parse the data."
        case .serverError:
            return "A server error occured."
        case .clientError:
            return "A client error occurred."
        case .malformedURL:
            return "The URL is malformed."
        case .unknown:
            return "Unknown error"
        }
    }

    var recoverySuggestion: String? {
        switch self {
        case .noInternet:
            return "Please check your internet connection and try again."
        case .parsingFailed:
            return "Please try again later or contact support."
        case .serverError:
            return "A server occured on the server, please wait a few minutes and try again."
        case .clientError:
            return "Please wait a few minutes and try again."
        case .malformedURL:
            return "Please contact support with the issue details."
        case .unknown:
            return "Please try again later or contact support."
        }
    }
}

