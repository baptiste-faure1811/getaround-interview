//
//  Card.swift
//  GetAround
//
//  Created by Baptiste Faure on 13/06/2024.
//

import SwiftUI

struct Card<Content: View>: View {
    public let spacing: CGFloat
    @ViewBuilder public let content: () -> Content
    var body: some View {
        VStack(alignment: .leading, spacing: spacing) {
            content()
        }
        .padding(DesignSystem.cardPadding)
        .background(.background200)
        .clipShape(RoundedRectangle(cornerRadius: DesignSystem.cornerRadius))
        .overlay {
            RoundedRectangle(cornerRadius: DesignSystem.cornerRadius)
                .stroke(.stroke200, lineWidth: DesignSystem.strokeWidth)
        }
    }
}
