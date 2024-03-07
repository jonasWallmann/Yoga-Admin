//
//  ScreenModifier.swift
//  Yoga Admin
//
//  Created by Jonas Wallmann on 22.02.24.
//

import SwiftUI

struct ScreenModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .padding(.horizontal, 24)
            .padding(.top, 36)
            .background(Color.lightest)
    }
}

extension View {
    public func screen() -> some View {
        modifier(ScreenModifier())
    }
}

#Preview {
    Text("Hello")
        .screen()
}
