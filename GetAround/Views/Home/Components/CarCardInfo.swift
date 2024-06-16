//
//  CarCardInfo.swift
//  GetAround
//
//  Created by Baptiste Faure on 13/06/2024.
//

import SwiftUI

struct CarCardInfo: View {
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
            }.animation(.spring, value: numberOfDays)
        }
    }
}

private struct CarRating: View {
    let rating: Rating
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
