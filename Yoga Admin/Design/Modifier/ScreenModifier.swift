//
//  ScreenModifier.swift
//  Yoga Admin
//
//  Created by Jonas Wallmann on 22.02.24.
//

import SwiftUI

struct ScreenModifier: ViewModifier {
    let leadingPadding: CGFloat
    let topPadding: CGFloat

    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .padding(.leading, leadingPadding)
            .padding(.top, topPadding)
            .background(Color.lightest)
    }
}

extension View {
    public func screen(leadingPadding: CGFloat = 24, topPadding: CGFloat = 24) -> some View {
        modifier(ScreenModifier(leadingPadding: leadingPadding, topPadding: topPadding))
    }
}

#Preview {
    Text("Hello")
        .screen()
}
