//
//  CardModifier.swift
//  Yoga Admin
//
//  Created by Jonas Wallmann on 20.02.24.
//

import SwiftUI

struct CardModifier: ViewModifier {
    @Environment(\.colorScheme) private var colorScheme

    let verticallyExtended: Bool
    let hasPadding: Bool

    func body(content: Content) -> some View {
        content
            .if(verticallyExtended, transform: { view in
                view.frame(maxHeight: .infinity, alignment: .top)
            })
            .if(hasPadding, transform: { view in
                view.padding(.horizontal, 24)
                    .padding(.vertical, 20)
            })
            .background(Color.snow)
            .clipShape(RoundedRectangle(cornerRadius: 12))

            .if(colorScheme == .light) { view in
                view.overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.light, lineWidth: 1)
                    )
                    .shadow(color: Color.medium.opacity(0.18), radius: 10, x: 0, y: 4)
            }
    }
}

public extension View {
    func card(verticallyExtended: Bool = false, hasPadding: Bool = true) -> some View {
        return modifier(CardModifier(verticallyExtended: verticallyExtended, hasPadding: hasPadding))
    }
}

#Preview {
    HStack(alignment: .top, spacing: 40) {
        Text("Hello, World!")
            .card()
        Text("Hello, World!")
            .card(verticallyExtended: true)
    }
    .padding()
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(Color.lightest)
}
