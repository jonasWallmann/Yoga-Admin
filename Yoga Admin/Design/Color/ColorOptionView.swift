//
//  ColorOptionView.swift
//  Yoga Admin
//
//  Created by Jonas Wallmann on 17.02.24.
//

import SwiftUI

struct ColorOptionView: View {
    let color: ColorEnum

    @Binding var selectedColor: ColorEnum?

    var body: some View {
        Button {
            selectedColor = color
        } label: {
                ZStack {
                    if color == selectedColor {
                        Circle()
                            .frame(width: 24)

                        Circle()
                            .stroke(lineWidth: 3)
                            .frame(width: 32)

                        Circle()
                            .frame(width: 8)
                            .offset(y: 26)
                    } else {
                        Circle()
                            .frame(width: 32)
                    }
                }
                .foregroundStyle(color.value)
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    HStack {
        ColorOptionView(color: .blue, selectedColor: .constant(.blue))
        ColorOptionView(color: .red, selectedColor: .constant(.blue))
    }
    .padding(100)
}
