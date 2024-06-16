//
//  CarRepository.swift
//  GetAround
//
//  Created by Baptiste Faure on 13/06/2024.
//

import Foundation

final class CarRepository {
    // In a 'classic' app, fetching cars could require pagination and filtering, those would be handled here, in the repository.
    public func fetchCars() async -> Result<[Car], FetchErrors> {
        guard let url = URL(string: Constants.CarsEndpoints) else {
            return .failure(.malformedURL)
        }
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let response = response as? HTTPURLResponse else {
                return .failure(.unknown(error: URLError(.badServerResponse)))
            }
            switch response.statusCode {
            case 200:
                do {
                    let cars: [Car] = try JSONDecoder().decode([Car].self, from: data)
                    return .success(cars)
                } catch {
                    return .failure(.parsingFailed)
                }
            case 400..<500:
                return .failure(.clientError)
            case 500..<600:
                return .failure(.serverError)
            default:
                return .failure(.unknown(error: URLError(.badServerResponse)))
            }
        } catch let error as URLError where error.code == .notConnectedToInternet {
            return .failure(.noInternet)
        } catch {
            return .failure(.unknown(error: error))
        }
    }
}
