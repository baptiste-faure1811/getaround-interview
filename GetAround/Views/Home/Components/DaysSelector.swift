//
//  DaysSelector.swift
//  GetAround
//
//  Created by Baptiste Faure on 13/06/2024.
//

import SwiftUI

struct DaysSelector: View {
    @Binding public var numberOfDays: Int
    var body: some View {
        Card(spacing: 0, cornerRadius: DesignSystem.CardCornerRadius.large, padding: DesignSystem.CardPadding.large) {
            Group {
                Text("Showing prices for:")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .fontWeight(.medium)

                // Using the iOS 17 'Grammar Agreement' to automatically handle plurals.
                // 'day' needs to be string interpolated.
                // See: https://www.hackingwithswift.com/forums/swiftui/odd-log-message-caused-by-automatic-grammar-agreement/20614
                Stepper("^[\(numberOfDays) \("day")](inflect: true)",
                        value: $numberOfDays.animation(),
                        in: 1 ... 31,
                        step: 1)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .sensoryFeedback(.increase, trigger: numberOfDays)
            }
            .animation(.default, value: numberOfDays)
            .contentTransition(.numericText())
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
        }
    }
}
