//
//  InfoSection.swift
//  GetAround
//
//  Created by Baptiste Faure on 13/06/2024.
//

import SwiftUI

struct InfoSection: View {
    public let car: Car
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            VStack(alignment: .leading, spacing: 6) {
                Text(car.name)
                    .font(.title)
                    .fontWeight(.bold)
                HStack(alignment: .center, spacing: 8) {
                    RatingStarsView(rating: car.rating.average, starSize: 18)

                    Group {
                        Text("\(car.rating.average, specifier: "%.2f") ")
                            .font(.callout)
                            .fontWeight(.medium)

                            + Text("(\(car.rating.count))")
                            .font(.callout)
                            .foregroundStyle(.secondary)
                    }.offset(x: 0, y: 1)
                }
            }
        }.frame(maxWidth: .infinity, alignment: .leading)
    }
}
