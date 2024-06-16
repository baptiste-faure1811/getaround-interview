//
//  CarImage.swift
//  GetAround
//
//  Created by Baptiste Faure on 13/06/2024.
//

import SwiftUI

struct CarImage: View {
    public let url: URL?
    public let cornerRadius: CGFloat
    var body: some View {
        AsyncImage(url: url) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .aspectRatio(DesignSystem.imageAspectRatio, contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
                    .overlay {
                        RoundedRectangle(cornerRadius: cornerRadius)
                            .stroke(.stroke100, lineWidth: DesignSystem.strokeWidth)
                    }
            } else if phase.error != nil {
                self.errorPlaceholder
            } else {
                self.placeholder
            }
        }
    }

    private var errorPlaceholder: some View {
        ZStack(alignment: .center) {
            RoundedRectangle(cornerRadius: cornerRadius)
                .fill(.background300)
                .stroke(.stroke300, lineWidth: DesignSystem.strokeWidth)
                .aspectRatio(DesignSystem.imageAspectRatio, contentMode: .fit)

            VStack(alignment: .center, spacing: 6) {
                Image(systemName: "exclamationmark.triangle.fill")
                    .font(.body)
                    .foregroundStyle(.orange.gradient.opacity(0.7))
                Text("An error occured while fetching the car image")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }.multilineTextAlignment(.center)
        }
    }

    private var placeholder: some View {
        ZStack(alignment: .center) {
            RoundedRectangle(cornerRadius: cornerRadius)
                .fill(.background300)
                .stroke(.stroke300, lineWidth: DesignSystem.strokeWidth)
                .aspectRatio(DesignSystem.imageAspectRatio, contentMode: .fit)

            ProgressView()
                .progressViewStyle(.circular)
        }
    }
}
