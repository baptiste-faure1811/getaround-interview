//
//  CarDetailsScreen.swift
//  GetAround
//
//  Created by Baptiste Faure on 13/06/2024.
//

import SwiftUI
import SwiftUILayoutGuides

/*
    This screen is not well optimized for iPad. For now, the view follows the readable content guide,
    but this is not ideal. It would be best to have a specific layout for larger screens.

    The 'price for X days' is only displayed when the selected number of days is greater than 1.

 */

struct CarDetailsScreen: View {
    public let car: Car
    public let numberOfDays: Int
    var body: some View {
        ScrollView {
            VStack(spacing: DesignSystem.spacing) {
                CarImage(url: car.picture, cornerRadius: DesignSystem.CardCornerRadius.large)

                InfoSection(car: car)

                Divider()

                PriceSection(car: car, numberOfDays: numberOfDays)

                OwnerSection(owner: car.owner)
            }
            .padding(.horizontal, 8)
            .fitToReadableContentWidth(alignment: .center)
        }
        .background(.background100)
        .navigationTitle(car.name)
        .navigationBarTitleDisplayMode(.large)
    }
}
