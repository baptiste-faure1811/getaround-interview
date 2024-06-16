//
//  SearchViewModel.swift
//  GetAround
//
//  Created by Baptiste Faure on 13/06/2024.
//

import Foundation
import Observation

@Observable
final class HomeViewModel {
    private(set) var cars: [Car] = []
    public var fetchError: FetchErrors?
    public var isFetchingCars: Bool = true
    public var selectedNumberOfDays: Int = 1

    private let carRepository: CarRepository = .init()

    public func loadCars() async {
        isFetchingCars = true
        cars = []

        // Simulate slow internet connection (2 seconds).
        try? await Task.sleep(nanoseconds: 2_000_000_000)

        let result = await carRepository.fetchCars()
        switch result {
        case .success(let cars):
            self.cars = cars
        case .failure(let error):
            fetchError = error
        }
        isFetchingCars = false
    }
}
