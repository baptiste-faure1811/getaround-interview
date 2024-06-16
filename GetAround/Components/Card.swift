//
//  Card.swift
//  GetAround
//
//  Created by Baptiste Faure on 13/06/2024.
//

import SwiftUI

struct Card<Content: View>: View {
    public let spacing: CGFloat
    public var cornerRadius: CGFloat
    public var padding: CGFloat
    @ViewBuilder public let content: () -> Content
    var body: some View {
        VStack(alignment: .leading, spacing: spacing) {
            content()
        }
        .padding(padding)
        .background(.background200)
        .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
        .overlay {
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(.stroke200, lineWidth: DesignSystem.strokeWidth)
        }
    }
}
