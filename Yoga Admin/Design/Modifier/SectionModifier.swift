//
//  SectionModifier.swift
//  Yoga Admin
//
//  Created by Jonas Wallmann on 18.02.24.
//

import SwiftUI

struct SectionModifier: ViewModifier {
    let horizontallyExtended: Bool

    var padding: CGFloat

    func body(content: Content) -> some View {
        content
            .padding(padding)
            .if(horizontallyExtended, transform: { view in
                view.frame(maxWidth: .infinity, alignment: .leading)
            })
            .background(Color.snow)
            .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

extension View {
    public func section(horizontallyExtended: Bool = true, padding: CGFloat = 16) -> some View {
        modifier(SectionModifier(horizontallyExtended: horizontallyExtended, padding: padding))
    }
}

#Preview {
    VStack(alignment: .leading, spacing: 40) {
        Text("Hello, world!")
            .section()
        Text("Hello, world!")
            .section(horizontallyExtended: false)
    }
    .padding()
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(Color.lightest)
}
