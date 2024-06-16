//
//  PriceSection.swift
//  GetAround
//
//  Created by Baptiste Faure on 13/06/2024.
//

import SwiftUI

struct PriceSection: View {
    public let car: Car
    public let numberOfDays: Int
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Label("Prices", systemImage: "eurosign.circle")
                .font(.title3)
                .symbolRenderingMode(.hierarchical)
                .fontWeight(.bold)

            HStack(alignment: .center, spacing: DesignSystem.spacing / 2) {
                Card(spacing: 0, cornerRadius: DesignSystem.CardCornerRadius.small, padding: DesignSystem.CardPadding.small) {
                    VStack(alignment: .leading, spacing: 2) {
                        Text("Price per day:")
                            .font(.footnote)
                            .foregroundStyle(.secondary)
                            .fontWeight(.medium)
                        Text(car.price_per_day, format: .currency(code: "EUR").precision(.fractionLength(...2)))
                            .font(.title3)
                            .fontWeight(.semibold)
                    }.frame(maxWidth: .infinity, alignment: .leading)
                }
                Card(spacing: 0, cornerRadius: DesignSystem.CardCornerRadius.small, padding: DesignSystem.CardPadding.small) {
                    VStack(alignment: .leading, spacing: 2) {
                        Text("Price for \(numberOfDays) days:")
                            .font(.footnote)
                            .foregroundStyle(.secondary)
                            .fontWeight(.medium)
                        Text(car.price_per_day * Double(numberOfDays), format: .currency(code: "EUR").precision(.fractionLength(...2)))
                            .font(.title3)
                            .fontWeight(.semibold)
                            .contentTransition(.numericText())
                    }.frame(maxWidth: .infinity, alignment: .leading)
                }.opacity(numberOfDays > 1 ? 1 : 0)
            }

        }.frame(maxWidth: .infinity, alignment: .leading)
    }
}

