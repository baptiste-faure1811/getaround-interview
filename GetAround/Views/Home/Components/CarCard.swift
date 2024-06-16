//
//  CarCar.swift
//  GetAround
//
//  Created by Baptiste Faure on 13/06/2024.
//

import SwiftUI

struct CarCardView: View {
    public let car: Car
    public let numberOfDays: Int
    var body: some View {
        Card(spacing: 8) {
            CarCardImage(url: car.picture)
            
            CarCardInfo(car: car, numberOfDays: numberOfDays)
                .padding(.horizontal, 3)
        }
    }
}
