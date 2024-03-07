//
//  NavTitleModifier.swift
//  Yoga Admin
//
//  Created by Jonas Wallmann on 22.02.24.
//

import SwiftUI

struct NavTitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.largeTitle)
            .foregroundStyle(Color.darkest)
            .bold()
    }
}

extension View {
    public func navTitle() -> some View {
        modifier(NavTitleModifier())
    }
}

#Preview {
    Text("Hello")
        .navTitle()
}
