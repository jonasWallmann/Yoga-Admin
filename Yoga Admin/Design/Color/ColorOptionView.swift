//
//  ColorOptionView.swift
//  Yoga Admin
//
//  Created by Jonas Wallmann on 17.02.24.
//

import SwiftUI

struct ColorOptionView: View {
    @Environment(\.colorScheme) private var colorScheme

    let color: ColorEnum

    @Binding var selectedColor: ColorEnum?

    let isPale: Bool

    private var previewColor: Color {
        isPale ? Color.paleFor(color: color, scheme: colorScheme) : color.value
    }

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

//                        Circle()
//                            .frame(width: 8)
//                            .offset(y: 26)
                    } else {
                        Circle()
                            .frame(width: 32)
                    }
                }
                .foregroundStyle(previewColor)
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    HStack {
        ColorOptionView(color: .blue, selectedColor: .constant(.blue), isPale: false)
        ColorOptionView(color: .red, selectedColor: .constant(.blue), isPale: false)
    }
    .padding(100)
}
