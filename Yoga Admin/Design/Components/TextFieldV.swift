//
//  TextFieldV.swift
//  Yoga Admin
//
//  Created by Jonas Wallmann on 17.02.24.
//

import SwiftUI

struct TextFieldV: View {
    let label: String

    @Binding var text: String

    let showingValidation: Bool
    let showTitle: Bool

    init(_ label: String, text: Binding<String>, showingValidation: Bool = false, showTitle: Bool = false) {
        self.label = label
        self._text = text
        self.showingValidation = showingValidation
        self.showTitle = showTitle
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            if showingValidation && text.isEmpty {
                Label("Please fill out the \(label.lowercased())", systemImage: "x.circle.fill")
                    .foregroundStyle(.red)
            }
            if showTitle {
                Text(label)
                    .foregroundStyle(Color.dark)
            }
            TextField(label, text: $text)
                .textFieldStyle(Custom())
        }
    }
}

#Preview {
    VStack(spacing: 70) {
        TextFieldV("Name", text: .constant(""), showingValidation: false, showTitle: true)
        TextFieldV("Name", text: .constant(""), showingValidation: true, showTitle: true)
    }
    .padding()
    .frame(width: 300)
}

