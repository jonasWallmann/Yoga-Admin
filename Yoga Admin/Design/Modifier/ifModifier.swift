//
//  ifModifier.swift
//  Yoga Admin
//
//  Created by Jonas Wallmann on 24.02.24.
//

import SwiftUI

extension View {
    @ViewBuilder func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}
