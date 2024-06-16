//
//  RatingStars.swift
//  GetAround
//
//  Created by Baptiste Faure on 13/06/2024.
//

import SwiftUI

struct RatingStarsView: View {
    public let rating: Double
    public let starSize: CGFloat

    private let starSpacing: CGFloat = 0

    var body: some View {
        ZStack(alignment: .center) {
            HStack(alignment: .center, spacing: starSpacing) {
                ForEach(0..<5) { _ in
                    Image(systemName: "star.fill")
                        .resizable()
                        .frame(width: starSize, height: starSize)
                        .foregroundColor(.secondary.opacity(0.5))
                }
            }
            GeometryReader { _ in
                HStack(alignment: .center, spacing: starSpacing) {
                    ForEach(0..<5) { _ in
                        Image(systemName: "star.fill")
                            .resizable()
                            .frame(width: starSize, height: starSize)
                            .foregroundColor(.yellow)
                    }
                }
                .mask(
                    Rectangle()
                        .size(width: (starSize + starSpacing) * CGFloat(rating) - starSpacing, height: starSize)
                )
            }
        }
        .frame(width: (starSize + starSpacing) * 5 - starSpacing, height: starSize)
    }
}
