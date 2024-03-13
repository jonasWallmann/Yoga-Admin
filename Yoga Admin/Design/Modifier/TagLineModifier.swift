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
            .foregroundStyle(Color.darkest)
            .font(.caption.bold())
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
