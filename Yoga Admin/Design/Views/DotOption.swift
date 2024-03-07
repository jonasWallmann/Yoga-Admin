//
//  DotOption.swift
//  Yoga Admin
//
//  Created by Jonas Wallmann on 22.02.24.
//

import SwiftUI

struct DotOption: View {
    let label: String
    var addition: String? = nil

    let isSelected: Bool

    let selectionCallback: () -> Void

    var body: some View {
        Button(action: selectionCallback) {
            HStack {
                ZStack {
                    Circle()
                        .strokeBorder(lineWidth: 2)
                        .frame(width: 14, height: 14)
                        .foregroundStyle(Color.accent)

                    Circle()
                        .frame(width: 8)
                        .foregroundStyle(isSelected ? Color.accent : Color.snow)
                }

                Text(label)

                if let addition = addition {
                    Spacer()
                    Text(addition)
                }
            }
            .foregroundStyle(Color.dark)
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    VStack {
        DotOption(label: "Beginners", addition: "9:30 AM", isSelected: false) {}
        DotOption(label: "Beginners", addition: "9:30 AM", isSelected: true) {}
    }
    .frame(maxWidth: 300)
}
