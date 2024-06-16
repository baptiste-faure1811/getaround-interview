//
//  CarCar.swift
//  GetAround
//
//  Created by Baptiste Faure on 13/06/2024.
//

import SwiftUI

struct CarCardWrapper: View {
    public let car: Car
    public let numberOfDays: Int
    var body: some View {
        Card(spacing: 8, cornerRadius: DesignSystem.CardCornerRadius.large, padding: DesignSystem.CardPadding.large) {
            CarImage(url: car.picture, cornerRadius: DesignSystem.CardCornerRadius.large - DesignSystem.CardPadding.large)
            
            CarCardInfo(car: car, numberOfDays: numberOfDays)
                .padding(.horizontal, 3)
        }
    }
}

fileprivate struct CarCardInfo: View {
    public let car: Car
    public let numberOfDays: Int
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack(alignment: .center, spacing: 0) {
                Text(car.brand + ", ")
                    .font(.title3)
                    .fontWeight(.bold)

                    + Text(car.model)
                    .font(.callout)
                    .foregroundStyle(.secondary)
                Spacer()
                CarRating(rating: car.rating)
            }

            Divider()

            HStack(alignment: .center, spacing: DesignSystem.spacing) {
                VStack(alignment: .leading, spacing: 2) {
                    Text("Price per day:")
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                        .fontWeight(.medium)
                    Text(car.price_per_day, format: .currency(code: "EUR").precision(.fractionLength(...2)))
                        .font(.title3)
                        .fontWeight(.semibold)
                }
                if numberOfDays > 1 {
                    VStack(alignment: .leading, spacing: 2) {
                        Text("Price for \(numberOfDays) days:")
                            .font(.footnote)
                            .foregroundStyle(.secondary)
                            .fontWeight(.medium)
                        Text(car.price_per_day * Double(numberOfDays), format: .currency(code: "EUR").precision(.fractionLength(...2)))
                            .font(.title3)
                            .fontWeight(.semibold)
                            .contentTransition(.numericText())
                    }
                }
                Spacer()

                Image(systemName: "chevron.forward")
                    .foregroundStyle(.secondary)
                    .font(.footnote)
                    .fontWeight(.semibold)
            }
            .animation(.default, value: numberOfDays)
        }
    }
}

fileprivate struct CarRating: View {
    public let rating: Rating
    var body: some View {
        HStack(alignment: .firstTextBaseline, spacing: 4) {
            Image(systemName: "star.fill")
                .font(.footnote)
                .foregroundStyle(.yellow)
            Text("\(rating.average, specifier: "%.2f")")
                .font(.footnote)
                .fontWeight(.medium)
            Text("(\(rating.count))")
                .font(.footnote)
                .foregroundStyle(.secondary)
        }
    }
}
