//
//  TagLineModifier.swift
//  Yoga Admin
//
//  Created by Jonas Wallmann on 13.03.24.
//

import SwiftUI

struct TagLineModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundStyle(.darkest)
            .font(.caption)
            .fontWeight(.bold)
            .tracking(0.8)
    }
}

extension View {
    public func tagLine() -> some View {
        modifier(TagLineModifier())
    }
}

#Preview {
    Text("Hello, world!")
        .tagLine()
}
