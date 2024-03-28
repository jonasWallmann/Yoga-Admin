//
//  ErrorLabel.swift
//  Yoga Admin
//
//  Created by Jonas Wallmann on 28.03.24.
//

import SwiftUI

struct ErrorLabel: View {
    let message: String

    init(_ message: String) {
        self.message = message
    }

    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: "x.circle.fill")
                .foregroundStyle(.red)
            Text(message)
                .foregroundStyle(.dark)
        }
    }
}

#Preview {
    ErrorLabel("Please fill out the student name")
        .padding()
        .background(.white)
}
