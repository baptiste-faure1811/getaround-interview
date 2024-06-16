//
//  OwnerSection.swift
//  GetAround
//
//  Created by Baptiste Faure on 13/06/2024.
//

import SwiftUI

struct OwnerSection: View {
    public let owner: Owner
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Label("Owner", systemImage: "person.badge.shield.checkmark.fill")
                .font(.title3)
                .symbolRenderingMode(.hierarchical)
                .fontWeight(.bold)

            OwnerCard(owner: owner)

        }.frame(maxWidth: .infinity, alignment: .leading)
    }
}

private struct OwnerCard: View {
    public let owner: Owner
    var body: some View {
        Card(spacing: 0, cornerRadius: DesignSystem.CardCornerRadius.small, padding: DesignSystem.CardPadding.small) {
            HStack(alignment: .center, spacing: 10) {
                OwnerAvatar(url: owner.picture, size: 56)

                VStack(alignment: .leading, spacing: 3) {
                    Text(owner.name)
                        .font(.headline)

                    HStack(alignment: .center, spacing: 4) {
                        RatingStarsView(rating: owner.rating.average, starSize: 14)

                        Group {
                            Text("\(owner.rating.average, specifier: "%.2f") ")
                                .font(.caption)
                                .fontWeight(.medium)

                                + Text("(\(owner.rating.count))")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }.offset(x: 0, y: 1)
                    }
                }
            }.frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

private struct OwnerAvatar: View {
    public let url: URL?
    public let size: CGFloat
    var body: some View {
        AsyncImage(url: url) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .aspectRatio(DesignSystem.imageAspectRatio, contentMode: .fill)
                    .frame(width: size, height: size)
                    .clipShape(Circle())
                    .overlay {
                        Circle()
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
            Circle()
                .fill(.background300)
                .stroke(.stroke300, lineWidth: DesignSystem.strokeWidth)
                .aspectRatio(DesignSystem.imageAspectRatio, contentMode: .fill)
                .frame(width: size, height: size)

            Image(systemName: "person")
                .font(.title2)
        }
    }

    private var placeholder: some View {
        ZStack(alignment: .center) {
            Circle()
                .fill(.background300)
                .stroke(.stroke300, lineWidth: DesignSystem.strokeWidth)
                .aspectRatio(DesignSystem.imageAspectRatio, contentMode: .fill)
                .frame(width: size, height: size)

            ProgressView()
                .progressViewStyle(.circular)
                .scaleEffect(0.7)
        }
    }
}
